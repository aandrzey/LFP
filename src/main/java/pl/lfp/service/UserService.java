package pl.lfp.service;

import pl.lfp.domain.User;

import java.util.List;

public interface UserService {

    User findUserByUsername(String Username);
    User saveUser(User user);
    User saveAdmin(User user);
    List<User>findAll();

}
