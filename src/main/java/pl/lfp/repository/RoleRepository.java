package pl.lfp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.lfp.domain.Role;

public interface RoleRepository extends JpaRepository<Role, Integer> {

    @Query("select r from Role r where r.name = ?1")
    Role findByName(String name);
}
