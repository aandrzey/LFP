package pl.lfp.domain.dto;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;
import pl.lfp.domain.*;

import javax.validation.constraints.Size;
import java.util.Date;
import java.util.List;

@Getter
@Setter
public class PostDto {

    private Game game;

    @Size(max = 500)
    private String description;

    private City city;

    private Venue venue;

    private boolean privateVenue;

    @Size(min = 2, max = 30)
    private String privateVenueName;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date dateStart;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date dateStop;

    private GameType gameType;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date created;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date updated;

    private User user;

    private List<Comment> comments;
}
