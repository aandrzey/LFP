package pl.lfp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.lfp.domain.User;
import pl.lfp.domain.dto.UserDto;
import pl.lfp.error.RegisterFailedException;
import pl.lfp.service.UserService;

import javax.validation.Valid;

@Controller
public class UserController {

    private UserService userService;

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/register")
    public String registerUser(Model model) {
        model.addAttribute("userDto", new UserDto());
        return "register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerUser(@Valid UserDto userDto, BindingResult result) {

        User user = null;

        if (!userService.isUsernameUnique(userDto.getUsername())) {
            FieldError ssoError = new FieldError("userDto", "username", userDto.getUsername() + "- użytkownik o takiej nazwie już istnieje");
            result.addError(ssoError);
        }

        if (!userService.isEmailUnique(userDto.getEmail())) {
            FieldError ssoError = new FieldError("userDto", "email", userDto.getEmail() + "- email już znajduje się w bazie danych");
            result.addError(ssoError);
        }

        try {
            user = userService.registerUser(userDto);
        } catch (RegisterFailedException e) {
            FieldError ssoError = new FieldError("userDto", "confirmPassword", "Hasła niepoprawne");
            result.addError(ssoError);
        }

        if (result.hasErrors()) {
            return "register";
        }
        return "redirect:login";
    }
}
