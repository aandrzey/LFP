package pl.lfp.service;

import pl.lfp.domain.City;

import java.util.List;

public interface CityService {
    void save(List<City> cities);
    Long count();
}
