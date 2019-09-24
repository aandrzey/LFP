package pl.lfp.fixture.impl;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import pl.lfp.domain.City;
import pl.lfp.fixture.Fixture;
import pl.lfp.service.CityService;

import java.io.*;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;


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

            Charset charset = StandardCharsets.UTF_8;
            File initialFile = new File("src/main/resources/external/TERC_Urzedowy_2019-09-23.csv");

            try (CSVParser csvParser = CSVParser.parse(initialFile, charset, CSVFormat.DEFAULT
                    .withFirstRecordAsHeader()
                    .withIgnoreHeaderCase()
                    .withTrim())
            ) {
                for (CSVRecord record : csvParser) {
                    City city = new City();
                    city.setVoivod(record.get("voivod"));
                    city.setCounty(record.get("county"));
                    city.setCommunity(record.get("community"));
                    city.setType(record.get("type"));
                    city.setName(record.get("name"));
                    city.setNameAdditional(record.get("nameAdditional"));
                    cityService.saveCity(city);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
