package pl.lfp.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import pl.lfp.domain.Post;

import java.util.Date;
import java.util.List;

public interface PostRepository extends JpaRepository<Post, Long> {

    @Query("select p from Post p where p.city.name like %:city% and p.game.name like %:game% and p.gameType.name like %:gameType% and p.dateStart >= :date")
    List<Post> findAllSearch(@Param("city") String city,
                             @Param("game") String game,
                             @Param("date") Date date,
                             @Param("gameType") String gameType);


    Page<Post> findAllByCityNameContainingAndGameNameContainingAndDateStartIsAfterAndGameTypeNameContaining(String cityName, String gameName,Date dateStart, String gameType, Pageable paging);

    @Query("select p from Post p where p.dateStart >= ?1")
    List<Post>findDate(Date date);

    List<Post>findAllByGameName(String gameName);

    @Modifying
    void deletePostsByUserId(Long userId);

    @Modifying
    void deletePostsByVenueId(Long venueId);

}
