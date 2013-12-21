package dao.impl;

import dao.BookDao;
import entity.Book;
import org.springframework.stereotype.Repository;

/**
 * Created by Administrator on 13-12-5.
 */
@Repository
public class BookDaoImpl extends GenericDaoImpl<Book,Long> implements BookDao {
}
