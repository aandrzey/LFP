package pl.lfp.service;

import pl.lfp.domain.User;
import pl.lfp.domain.dto.UserDto;
import pl.lfp.error.RegisterFailedException;

import java.util.List;

public interface UserService {

    User findUserByUsername(String Username);
    User saveUser(User user);
    User saveAdmin(User user);
    List<User> findAll();
    User registerUser(UserDto userDto) throws RegisterFailedException;
    void updateUser(User user, UserDto userDto);
    boolean isUsernameUnique(String username);
    boolean isEmailUnique(String email);

}
