package dao.impl;

import dao.GenericDao;
import dao.UserDao;
import entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 13-12-5.
 */
@Repository
public class UserDaoImpl extends GenericDaoImpl<User,Integer> implements UserDao {

}
