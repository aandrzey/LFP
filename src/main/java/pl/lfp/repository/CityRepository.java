package pl.lfp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.lfp.domain.City;

public interface CityRepository extends JpaRepository<City, Long> {
}
