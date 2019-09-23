package pl.lfp.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.time.LocalDateTime;

@Entity
@Table(name = "comments")
@Getter
@Setter
public class Comment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Size()
    private String content;

    private LocalDateTime created;

    private LocalDateTime updated;

    @ManyToOne
    private User user;

    @ManyToOne
    private Post post;
}
