package pl.lfp.service;

import pl.lfp.domain.Post;

import java.util.Date;
import java.util.List;

public interface PostService {

    List<Post> findAllSearch(Integer pageNumber,
                       Integer pageSize,
                       String city,
                       String game,
                       String venue,
                       Date date,
                       String gameType);
    List<Post> findAll(Integer pageNumber, Integer pageSize);
    Post save(Post post);
    Post findById(Long id);
    List<Post>findDate(Date date);
    Long count();
}
