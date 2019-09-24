package pl.lfp.service;

import pl.lfp.domain.Venue;

import java.util.List;

public interface VenueService {

    Venue findByName(String name);
    List<Venue> findAllVerifiedByCityId(Long cityId);
    Venue save(Venue venue);
}
