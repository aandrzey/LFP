package pl.lfp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.lfp.domain.Game;

public interface GameRepository extends JpaRepository<Game, Long> {

    Game findByName(String name);

}
