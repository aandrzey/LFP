package pl.lfp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.lfp.domain.Post;

public interface PostRepository extends JpaRepository<Post, Long> {
}
