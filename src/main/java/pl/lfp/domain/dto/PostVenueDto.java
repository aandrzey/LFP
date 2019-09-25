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
public class PostVenueDto extends PostCityDto {

    private Venue venue;

    private boolean privateVenue;

    private String privateVenueName;

}
