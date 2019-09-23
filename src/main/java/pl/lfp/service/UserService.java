package pl.lfp.service;

import pl.lfp.domain.User;

public interface UserService {

    User findUserByUsername(String Username);
    User saveUser(User user);
    User saveAdmin(User user);

}
