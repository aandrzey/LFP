package pl.lfp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import pl.lfp.domain.Venue;

import java.util.List;

public interface VenueRepository extends JpaRepository<Venue, Long> {

    Venue findByName(String name);
    List<Venue> findAllByCityIdAndVerifiedTrue(Long id);
    List<Venue>findAllByVerifiedTrue();
    List<Venue>findAllByVerifiedFalse();

    @Query("update Venue v set v.verified = true where v.id = ?1")
    @Modifying
    void verifyVenueById(Long venueId);
}
