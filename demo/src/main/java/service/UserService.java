package service;

import entity.User;

/**
 * Created by Administrator on 13-12-5.
 */
public interface UserService extends GenericService<User,Integer> {
    User login(User user);
    Boolean singup(User user);
    Boolean findByName(String username);
}
