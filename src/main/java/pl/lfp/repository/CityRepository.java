package pl.lfp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.lfp.domain.City;

import java.util.List;

public interface CityRepository extends JpaRepository<City, Long> {

    @Query("select c from City c where c.nameAdditional like '%miasto%' order by c.name asc")
    List<City> findAllSorted();
}
