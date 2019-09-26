package pl.lfp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import pl.lfp.domain.Comment;

public interface CommentRepository extends JpaRepository<Comment, Long> {

    @Modifying
    void deleteCommentsByUserId(Long id);
}
