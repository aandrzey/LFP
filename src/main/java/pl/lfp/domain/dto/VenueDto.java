package pl.lfp.domain.dto;

import lombok.Getter;
import lombok.Setter;
import pl.lfp.domain.City;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Getter
@Setter
public class VenueDto {

    @NotBlank
    private String name;

    @NotNull
    private City city;

    @NotBlank
    private String address;

    private boolean verified;
}
