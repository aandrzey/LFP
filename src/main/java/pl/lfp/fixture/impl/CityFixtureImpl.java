package pl.lfp.fixture.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import pl.lfp.domain.City;
import pl.lfp.fixture.Fixture;
import pl.lfp.service.CityService;
import pl.lfp.utils.CsvUtils;

import java.io.*;
import java.util.List;

@Component
public class CityFixtureImpl implements Fixture {

    private final CityService cityService;

    @Autowired
    public CityFixtureImpl(CityService cityService) {
        this.cityService = cityService;
    }

    @Override
    public void loadData() {
        if (cityService.count() == 0) {
            File initialFile = new File("src/main/resources/external/TERC_Urzedowy_2019-09-23.csv");
            InputStream targetStream = null;
            try {
                targetStream = new FileInputStream(initialFile);
                List<City> cities = CsvUtils.read(City.class, targetStream, ',');
                cityService.save(cities);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
