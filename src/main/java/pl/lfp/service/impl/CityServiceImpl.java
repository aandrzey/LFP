package pl.lfp.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.lfp.domain.City;
import pl.lfp.repository.CityRepository;
import pl.lfp.service.CityService;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class CityServiceImpl implements CityService {

    private final CityRepository cityRepository;

    @Autowired
    public CityServiceImpl(CityRepository cityRepository) {
        this.cityRepository = cityRepository;
    }

    @Override
    public void save(List<City> cities) {
        for (City city : cities) {
            cityRepository.save(city);
        }
    }

    @Override
    public City saveCity(City city) {
        return cityRepository.save(city);
    }

    @Override
    public Long count() {
        return cityRepository.count();
    }

    @Override
    public List<City> getCitiesSorted() {
        return cityRepository.findAllSorted();
    }

    @Override
    public City findById(Long id) {
        return cityRepository.findById(id).orElse(null);
    }


}
