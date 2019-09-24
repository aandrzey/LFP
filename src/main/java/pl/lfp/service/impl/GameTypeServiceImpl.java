package pl.lfp.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.lfp.domain.GameType;
import pl.lfp.repository.GameTypeRepository;
import pl.lfp.service.GameTypeService;

import java.util.List;

@Service
public class GameTypeServiceImpl implements GameTypeService {

    private GameTypeRepository gameTypeRepository;

    @Autowired
    public GameTypeServiceImpl(GameTypeRepository gameTypeRepository) {
        this.gameTypeRepository = gameTypeRepository;
    }

    @Override
    public GameType findByName(String name) {
        return gameTypeRepository.findByName(name);
    }

    @Override
    public GameType save(GameType gameType) {
        return gameTypeRepository.save(gameType);
    }

    @Override
    public List<GameType> findAll() {
        return gameTypeRepository.findAll();
    }
}
