package pl.lfp.domain;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.Formula;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "posts")
@Getter
@Setter
public class Post {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @NotNull
    private Game game;

    @NotBlank
    @Size(max = 500)
    private String description;

    @ManyToOne
    @NotNull
    private City city;

    @ManyToOne
    private Venue venue;

    private boolean privateVenue;

    @Size(min = 2, max = 30)
    private String privateVenueName;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    @NotNull
    private Date dateStart;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    @NotNull
    private Date dateStop;

    @NotNull
    @ManyToOne
    private GameType gameType;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date created;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date updated;

    @ManyToOne
    private User user;

    @OneToMany(mappedBy = "post", cascade = CascadeType.REMOVE)
    private List<Comment> comments;

    @PrePersist
    public void prePersist() {
        created = new Date();
    }

    @PreUpdate
    public void preUpdate() {
        updated = new Date();
    }

}
