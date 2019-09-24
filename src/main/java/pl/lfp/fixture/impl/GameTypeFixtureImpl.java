package pl.lfp.fixture.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import pl.lfp.domain.GameType;
import pl.lfp.fixture.Fixture;
import pl.lfp.service.GameTypeService;

import java.util.Arrays;
import java.util.List;

@Component
public class GameTypeFixtureImpl implements Fixture {

    private final GameTypeService gameTypeService;

    private List<String> gameTypeNames = Arrays.asList("luźna gra", "competitive", "turniej");

    @Autowired
    public GameTypeFixtureImpl(GameTypeService gameTypeService) {
        this.gameTypeService = gameTypeService;
    }

    @Override
    public void loadData() {

        for (String gameTypeName : gameTypeNames) {
            if (gameTypeService.findByName(gameTypeName) == null) {
                GameType gameType = new GameType();
                gameType.setName(gameTypeName);
                gameTypeService.save(gameType);
            }
        }
    }
}
