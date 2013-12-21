package service.impl;

import dao.GenericDao;
import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import service.UserService;

import java.util.List;

/**
 * Created by Administrator on 13-12-5.
 */
@Service
public class UserServiceImpl extends GenericServiceImpl<User,Integer> implements UserService {
    @Override
    @Autowired
    @Qualifier("userDaoImpl")
    public void setGenericDao(GenericDao<User, Integer> genericDao) {
        super.genericDao=genericDao;
    }

    @Override
    public User login(User user) {
        String hql="from User where username=:username and password=:password";
        String[] params={"username","password"};
        Object[] values={user.getUsername(),user.getPassword()};
        List<User> users=genericDao.query(hql,params,values);
        if(users.size()==1){
            return users.get(0);
        }
        return null;
    }

    @Override
    public Boolean singup(User user) {
       boolean b= findByName(user.getUsername());
        if (b) {
            genericDao.add(user);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public Boolean findByName(String username) {
        String hql="from User where username=:username";
        String[] params={"username"};
        Object[] values={username};
        List<User> users=genericDao.query(hql,params,values);
        if(users.size()>0){
            return false;
        }
        return true;
    }

}
