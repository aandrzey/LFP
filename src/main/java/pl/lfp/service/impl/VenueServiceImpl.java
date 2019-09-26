package pl.lfp.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.lfp.domain.Venue;
import pl.lfp.repository.VenueRepository;
import pl.lfp.service.VenueService;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class VenueServiceImpl implements VenueService {

    private final VenueRepository venueRepository;

    @Autowired
    public VenueServiceImpl(VenueRepository venueRepository) {
        this.venueRepository = venueRepository;
    }

    @Override
    public Venue findByName(String name) {
        return venueRepository.findByName(name);
    }

    @Override
    public List<Venue> findAllVerifiedByCityId(Long cityId) {
        return venueRepository.findAllByCityIdAndVerifiedTrue(cityId);
    }

    @Override
    public Venue save(Venue venue) {
        return venueRepository.save(venue);
    }

    @Override
    public List<Venue> findAllVerified() {
        return venueRepository.findAllByVerifiedTrue();
    }

    @Override
    public List<Venue> findAllToVerify() {
        return venueRepository.findAllByVerifiedFalse();
    }

    @Override
    public Venue findVenueById(Long id) {
        return venueRepository.findById(id).orElse(null);
    }

    @Override
    public void verifyVenueById(Long id) {
        venueRepository.verifyVenueById(id);
    }

    @Override
    public void deleteVenueById(Long id) {
        venueRepository.deleteById(id);
    }
}
