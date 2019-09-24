package pl.lfp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.lfp.domain.Venue;

import java.util.List;

public interface VenueRepository extends JpaRepository<Venue, Long> {

    Venue findByName(String name);
    List<Venue> findAllByCityIdAndVerifiedTrue(Long id);
}
