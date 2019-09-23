package pl.lfp.service;

import pl.lfp.domain.Role;

public interface RoleService {
    Role findByName(String name);
    Role save(Role role);
    Long count();
}
