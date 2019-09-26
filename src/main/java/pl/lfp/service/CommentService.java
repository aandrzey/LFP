package pl.lfp.service;

import pl.lfp.domain.Comment;

public interface CommentService {

    Comment save(Comment comment);

    void deleteByUserId(Long userId);
}
