package pl.lfp.fixture.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import pl.lfp.domain.User;
import pl.lfp.fixture.Fixture;
import pl.lfp.service.UserService;

@Component
public class UserFixtureImpl implements Fixture {

    private final UserService userService;

    @Autowired
    public UserFixtureImpl(UserService userService) {
        this.userService = userService;
    }

    @Override
    public void loadData() {
        if (userService.findUserByUsername("admin") == null) { //tworze admina

            User user = new User();
            user.setUsername("admin");
            user.setPassword("admin");
            userService.saveAdmin(user);
        }
        if (userService.findUserByUsername("user") == null) { //tworze admina

            User user = new User();
            user.setUsername("user");
            user.setPassword("user");
            userService.saveUser(user);
        }
    }
}
