package pl.lfp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {

    @RequestMapping("/")
    public String sayHello(){
        return "index";
    }

    @RequestMapping("/about")
    @ResponseBody
    public String about(){
        return "about";
    }
}
