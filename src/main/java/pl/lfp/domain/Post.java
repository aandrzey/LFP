package pl.lfp.domain;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;

@Entity
@Table(name = "posts")
@Getter
@Setter
public class Post {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    //todo dropdown z systemem (czy system przechowywyać jako klasę?)
    private String system;

    @NotBlank
    @Size(max = 500)
    private String description;

    //todo dropdown z miastem (jak przechowywać miasta)
    private String city;

    @NotNull
    @ManyToOne
    private Venue venue;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate date;

    @DateTimeFormat(pattern = "HH:mm")
    private LocalTime timeFrom;

    @DateTimeFormat(pattern = "HH:mm")
    private LocalTime timeTo;

    private Integer hoursToSpend;

    @NotNull
    private String typeOfGame;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private LocalDateTime created;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private LocalDateTime updated;

    @ManyToOne
    private User user;

    @OneToMany(mappedBy = "post")
    private List<Comment> comments;


}
