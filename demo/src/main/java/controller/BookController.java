package controller;

import entity.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import service.BookService;

import java.io.File;
import java.io.IOException;

/**
 * Created by Administrator on 13-12-5.
 */
@Controller
@RequestMapping("book")
public class BookController extends BaseController{
    @Autowired
    private BookService bookService;
//    限定提交方式只能接受post提交,如果不写的话，post或get提交都可以
    @RequestMapping(value = "test",method = RequestMethod.GET)
    private String test(@RequestParam("key")String value){
        System.out.println("===="+value);
        return "index";
    }


    @RequestMapping("list")
    private String list() {
        super.session.setAttribute("books", bookService.list());
        return "redirect:list.jsp";
    }
//    以"/"的方式传参
    @RequestMapping("search/{id}")
    private String search(@PathVariable("id")long id) {
        super.session.setAttribute("book", bookService.search(id));
        return "redirect:/book/edit.jsp";
    }
//    以"？"的方式传参
    @RequestMapping("remove")
    private String remove(@RequestParam("id")long id) {
        bookService.remove(id);
        return "redirect:list";
    }
    @RequestMapping("modify")
    private String modify(Book book,@RequestParam("file")MultipartFile file) throws IOException {
        if(!file.isEmpty()){
            String path = super.request.getServletContext().getRealPath("upload");
            file.transferTo(new File(path+"/"+file.getOriginalFilename()));
            book.setPicture(file.getOriginalFilename());
        }
        bookService.modify(book);
        return "redirect:list";
    }
    @RequestMapping(value = "add",method = RequestMethod.POST)
    private String add(Book book, @RequestParam("file") MultipartFile file) throws IOException {
        if (!file.isEmpty()) {
            String path = super.request.getServletContext().getRealPath("/upload");
//            file.transferTo(new File(path + "/" + file.getOriginalFilename()));

            String[] files=file.getOriginalFilename().split("\\.");
            String filename=String.valueOf(System.currentTimeMillis())+"."+files[files.length-1];
            System.out.println(filename+"  ------------");
            file.transferTo(new File(path + "/" + filename));
            book.setPicture(filename);
        }
        System.out.println(book.getPicture()+"===========");
        bookService.add(book);
        return "redirect:list";
    }
}
