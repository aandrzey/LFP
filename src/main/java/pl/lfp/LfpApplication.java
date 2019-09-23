package pl.lfp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import pl.lfp.fixture.impl.CityFixtureImpl;
import pl.lfp.fixture.impl.RoleFixtureImpl;
import pl.lfp.fixture.impl.UserFixtureImpl;

@SpringBootApplication
public class LfpApplication {

    private final RoleFixtureImpl roleFixture;
    private final UserFixtureImpl userFixture;
    private final CityFixtureImpl cityFixture;

    @Autowired
    public LfpApplication(RoleFixtureImpl roleFixture, UserFixtureImpl userFixture, CityFixtureImpl cityFixture) {
        this.roleFixture = roleFixture;
        this.userFixture = userFixture;
        this.cityFixture = cityFixture;
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
        };
    }

}
