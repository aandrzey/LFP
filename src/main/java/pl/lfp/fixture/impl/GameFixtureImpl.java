package pl.lfp.fixture.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import pl.lfp.domain.Game;
import pl.lfp.fixture.Fixture;
import pl.lfp.service.GameService;

import java.util.Arrays;
import java.util.List;

@Component
public class GameFixtureImpl implements Fixture {

    private final GameService gameService;

    private List<String> gameNames = Arrays.asList("Warhammer 40k", "Warhammer 30k", "Age of Sigmar", "X-wing", "Saga", "Infinity", "Hail Caesar");

    @Autowired
    public GameFixtureImpl(GameService gameService) {
        this.gameService = gameService;
    }

    @Override
    public void loadData() {
        for (String gameName : gameNames) {
            if(gameService.findByName(gameName) == null) {
                Game game = new Game();
                game.setName(gameName);
                gameService.save(game);
            }
        }
    }
}
