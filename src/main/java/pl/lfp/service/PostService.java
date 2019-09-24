package pl.lfp.service;

import pl.lfp.domain.Post;

import java.util.List;

public interface PostService {

    List<Post> findAll(Integer pageNumber, Integer pageSize);
}
