package pl.lfp.service;

import pl.lfp.domain.Post;

import java.util.Date;
import java.util.List;

public interface PostService {

    List<Post> findAllSearch(Integer pageNumber,
                       Integer pageSize,
                       String city,
                       String game,
                       Date date,
                       String gameType);
    Integer countAllSearch(String city,
                           String game,
                           Date date,
                           String gameType);
    Post save(Post post);
    Post findById(Long id);
    Long count();
    List<Post> findAllByGameName(String gameName);
    void deleteByUserId(Long userId);
    void deleteByVenueId(Long venueId);
    void deleteById(Long id);
}
