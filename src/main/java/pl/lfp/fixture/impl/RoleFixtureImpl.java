package pl.lfp.fixture.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import pl.lfp.domain.Role;
import pl.lfp.fixture.Fixture;
import pl.lfp.repository.RoleRepository;

@Component
public class RoleFixtureImpl implements Fixture {

    private final RoleRepository roleRepository;

    @Autowired
    public RoleFixtureImpl(RoleRepository roleRepository) {
        this.roleRepository = roleRepository;
    }

    @Override
    public void loadData() {
        if (roleRepository.count() == 0) {
            if (roleRepository.findByName("ROLE_ADMIN") == null) { //patrzymy czy mamy role admin i jesli nie to ja tworzymy
                Role r = new Role();
                r.setName("ROLE_ADMIN");
                roleRepository.save(r);
            }
            if (roleRepository.findByName("ROLE_USER") == null) { //analogicznie do roli wyzej
                Role r = new Role();
                r.setName("ROLE_USER");
                roleRepository.save(r);
            }
        }
    }
}
