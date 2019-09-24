package pl.lfp.domain.dto;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.validator.constraints.UniqueElements;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Getter
@Setter
public class UserDto {

    private Long id;

    @NotBlank
    @Size(min = 2, max = 20)
    private String username;

    //todo zmienić validację na emailu
    @NotBlank
    @Email
    private String email;

    //todo ustawić walidację na password
    @NotBlank
    @Size(min = 6, max = 20)
    private String password;

    @NotBlank
    @Size(min = 6, max = 20)
    private String confirmPassword;
}
