package pl.lfp.domain.dto;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;
import pl.lfp.domain.*;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Date;
import java.util.List;

@Getter
@Setter
public class PostDto extends PostVenueDto {

    @NotNull
    private Game game;

    @Size(max = 500)
    @NotBlank
    private String description;

    @NotBlank
    private String dateStart;

    @NotBlank
    private String timeStart;

    @NotBlank
    private String dateStop;

    @NotBlank
    private String timeStop;

    @NotNull
    private GameType gameType;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date created;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date updated;

    private User user;

    private List<Comment> comments;
}
