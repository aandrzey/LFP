package pl.lfp.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import pl.lfp.domain.Role;
import pl.lfp.domain.User;
import pl.lfp.domain.dto.UserDto;
import pl.lfp.error.RegisterFailedException;
import pl.lfp.repository.RoleRepository;
import pl.lfp.repository.UserRepository;
import pl.lfp.service.UserService;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final BCryptPasswordEncoder passwordEncoder;

    @Autowired
    public UserServiceImpl(UserRepository userRepository, RoleRepository roleRepository,
                           BCryptPasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    @Override
    public User findUserByUsername(String Username) {
        return userRepository.findByUsername(Username);
    }

    @Override
    public User saveUser(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setEnabled(1);
        Role userRole = roleRepository.findByName("ROLE_USER");
        user.setRoles(new HashSet<Role>(Arrays.asList(userRole)));
        return userRepository.save(user);
    }

    @Override
    public User saveAdmin(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setEnabled(1);
        Role userRole = roleRepository.findByName("ROLE_USER");
        Role adminRole = roleRepository.findByName("ROLE_ADMIN");
        user.setRoles(new HashSet<Role>(Arrays.asList(userRole, adminRole)));
        return userRepository.save(user);
    }

    @Override
    public List<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    public User registerUser(UserDto userDto) throws RegisterFailedException {
        if (!userDto.getPassword().equals(userDto.getConfirmPassword())) {
            throw new RegisterFailedException("Password incorrect");
        }
        Role userRole = roleRepository.findByName("ROLE_USER");

        User user = new User();
        user.setUsername(userDto.getUsername()); //Username
        user.setEmail(userDto.getEmail()); //Email
        user.setPassword(passwordEncoder.encode(userDto.getPassword())); // Password
        user.setEnabled(1); // Enabled
        user.setRoles(new HashSet<Role>(Arrays.asList(userRole))); //Roles

        return userRepository.save(user);
    }

    @Override
    public void updateUser(User user, UserDto userDto) {
        user.setPassword(passwordEncoder.encode(userDto.getPassword()));
        userRepository.save(user);
    }

    @Override
    public boolean isUsernameUnique(String username) {
        User user = userRepository.findByUsername(username);
        return user == null;
    }

    @Override
    public boolean isEmailUnique(String email) {
        User user = userRepository.findByEmail(email);
        return user == null;
    }

}
