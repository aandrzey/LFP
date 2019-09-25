package pl.lfp.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import pl.lfp.domain.Post;

import java.util.Date;
import java.util.List;

public interface PostRepository extends JpaRepository<Post, Long> {

    @Query("select p from Post p where p.city.name like %:city% and p.game.name like %:game% and p.venue.name like %:venue% and p.dateStart like %:date% and p.gameType.name like %:gameType%")
    Page<Post> findAllSearch(@Param("city") String city,
                             @Param("game") String game,
                             @Param("venue") String venue,
                             @Param("date") Date date,
                             @Param("gameType") String gameType,
                             Pageable paging);

}
