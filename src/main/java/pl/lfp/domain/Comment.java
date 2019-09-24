package pl.lfp.domain;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.time.LocalDateTime;
import java.util.Date;

@Entity
@Table(name = "comments")
@Getter
@Setter
public class Comment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Size(min = 2, max = 300)
    private String content;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date created;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date updated;

    @ManyToOne
    private User user;

    @ManyToOne
    private Post post;
}
