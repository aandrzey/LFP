package pl.lfp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import pl.lfp.fixture.impl.*;

@SpringBootApplication
public class LfpApplication {

    private final RoleFixtureImpl roleFixture;
    private final UserFixtureImpl userFixture;
    private final CityFixtureImpl cityFixture;
    private final GameFixtureImpl gameFixture;
    private final GameTypeFixtureImpl gameTypeFixture;

    @Autowired
    public LfpApplication(RoleFixtureImpl roleFixture, UserFixtureImpl userFixture, CityFixtureImpl cityFixture, GameFixtureImpl gameFixture, GameTypeFixtureImpl gameTypeFixture) {
        this.roleFixture = roleFixture;
        this.userFixture = userFixture;
        this.cityFixture = cityFixture;
        this.gameFixture = gameFixture;
        this.gameTypeFixture = gameTypeFixture;
    }

    public static void main(String[] args) {

        SpringApplication.run(LfpApplication.class, args);
    }

    @Bean
    CommandLineRunner init() { //funkcja ktora uruchamia sie podczas startu aplikacji (za kazdym razem)
        return (args) -> {

            roleFixture.loadData();
            userFixture.loadData();
            cityFixture.loadData();
            gameFixture.loadData();
            gameTypeFixture.loadData();
        };
    }

}
