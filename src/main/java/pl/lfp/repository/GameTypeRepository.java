package pl.lfp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.lfp.domain.GameType;

public interface GameTypeRepository extends JpaRepository<GameType, Long> {

    GameType findByName(String name);

}
