package service.impl;

import dao.GenericDao;
import entity.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import service.BookService;
import service.GenericService;

/**
 * Created by Administrator on 13-12-5.
 */
@Service
public class BookServiceImpl extends GenericServiceImpl<Book,Long> implements BookService {

    @Override
    @Autowired
    @Qualifier("bookDaoImpl")
    public void setGenericDao(GenericDao<Book, Long> genericDao) {
           super.genericDao=genericDao;
    }
}
