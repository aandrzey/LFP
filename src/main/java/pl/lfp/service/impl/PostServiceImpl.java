package pl.lfp.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import pl.lfp.domain.Post;
import pl.lfp.repository.PostRepository;
import pl.lfp.service.PostService;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class PostServiceImpl implements PostService {

    private final PostRepository postRepository;

    @Autowired
    public PostServiceImpl(PostRepository postRepository) {
        this.postRepository = postRepository;
    }

    @Override
    public List<Post> findAllSearch(Integer pageNumber,
                                    Integer pageSize,
                                    String city,
                                    String game,
                                    String venue,
                                    Date date,
                                    String gameType) {
        Pageable paging = PageRequest.of(pageNumber, pageSize);
        Page<Post> pagedResult = postRepository.findAllSearch(city, game, venue, date, gameType, paging);

        if (pagedResult.hasContent()) {
            return pagedResult.getContent();
        } else {
            return new ArrayList<Post>();
        }
    }

    @Override
    public List<Post> findAll(Integer pageNumber, Integer pageSize) {
        Pageable paging = PageRequest.of(pageNumber, pageSize);
        Page<Post> pagedResult = postRepository.findAll(paging);

        if (pagedResult.hasContent()) {
            return pagedResult.getContent();
        } else {
            return new ArrayList<Post>();
        }
    }

    @Override
    public Post save(Post post) {
        if (post.getVenue().getId() == null) {
            post.setVenue(null);
        }
        return postRepository.save(post);
    }

    @Override
    public Post findById(Long id) {
        return postRepository.findById(id).orElse(null);
    }

    @Override
    public List<Post> findDate(Date date) {
        return postRepository.findDate(date);
    }

    @Override
    public Long count() {
        return postRepository.count();
    }
}
