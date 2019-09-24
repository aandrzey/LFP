package pl.lfp.service;

import pl.lfp.domain.Game;

import java.util.List;

public interface GameService {

    Game findByName(String name);
    Game save(Game game);
    List<Game> findAll();

}
