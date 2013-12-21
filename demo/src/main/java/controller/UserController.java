package controller;

import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import service.UserService;

/**
 * Created by Administrator on 13-12-5.
 */
@Controller
@RequestMapping("user")
public class UserController extends BaseController {
    @Autowired
    private UserService userService;

    @RequestMapping("login")
    private String login(User user) {
        user = userService.login(user);
        if (user != null) {
            super.session.setAttribute("user", user);
            return "redirect:index.jsp";
        } else {
            super.request.setAttribute("loginmessage", "invalid username or password");
            return "index";
        }
    }

    @RequestMapping("signup")
    private String signup(User user) {
        System.out.println(user);
        boolean b = userService.singup(user);
        if (b) {
            return "index";
        } else {
            super.session.setAttribute("singupmessage", "注册用户已经存在");
            return "redirect:signup.jsp";
        }
    }
    @RequestMapping("logout")
    private String logout(){
        super.session.invalidate();
        return "redirect:/index.jsp";
    }

}
