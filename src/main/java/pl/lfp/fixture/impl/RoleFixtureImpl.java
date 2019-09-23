package pl.lfp.fixture.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import pl.lfp.domain.Role;
import pl.lfp.fixture.Fixture;
import pl.lfp.service.RoleService;

@Component
public class RoleFixtureImpl implements Fixture {

    private final RoleService roleService;

    @Autowired
    public RoleFixtureImpl(RoleService roleService) {
        this.roleService = roleService;
    }

    @Override
    public void loadData() {
        if (roleService.count() == 0) {
            if (roleService.findByName("ROLE_ADMIN") == null) { //patrzymy czy mamy role admin i jesli nie to ja tworzymy
                Role r = new Role();
                r.setName("ROLE_ADMIN");
                roleService.save(r);
            }
            if (roleService.findByName("ROLE_USER") == null) { //analogicznie do roli wyzej
                Role r = new Role();
                r.setName("ROLE_USER");
                roleService.save(r);
            }
        }
    }
}
