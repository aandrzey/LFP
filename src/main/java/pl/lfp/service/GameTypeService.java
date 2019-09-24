package pl.lfp.service;

import pl.lfp.domain.GameType;

import java.util.List;

public interface GameTypeService {

    GameType findByName(String name);
    GameType save(GameType gameType);
    List<GameType> findAll();
}
