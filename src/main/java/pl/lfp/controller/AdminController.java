package pl.lfp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.lfp.service.CommentService;
import pl.lfp.service.PostService;
import pl.lfp.service.UserService;
import pl.lfp.service.VenueService;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private UserService userService;
    private VenueService venueService;
    private CommentService commentService;
    private PostService postService;

    @Autowired
    public AdminController(UserService userService, VenueService venueService, CommentService commentService, PostService postService) {
        this.userService = userService;
        this.venueService = venueService;
        this.commentService = commentService;
        this.postService = postService;
    }

    @RequestMapping("/users")
    public String showUsers(Model model){
        model.addAttribute("users", userService.findAll());
        return "users";
    }

    @RequestMapping("/user/delete/{id}")
    public String deleteUser(@PathVariable Long id){
        postService.deleteByUserId(id);
        commentService.deleteByUserId(id);
        userService.deleteUserById(id);
        return "redirect:../../users";
    }

    @RequestMapping("/venues/verified")
    public String showVerifiedVenues(Model model){
        model.addAttribute("venues", venueService.findAllVerified());
        model.addAttribute("verified", true);
        return "venues";
    }

    @RequestMapping("/venues/toVerify")
    public String showVenuesToVerify(Model model){
        model.addAttribute("venues", venueService.findAllToVerify());
        model.addAttribute("verified", false);
        return "venues";
    }

    @RequestMapping("/venue/verify/{id}")
    public String verifyVenue(@PathVariable Long id, Model model){
        boolean isVerified = venueService.findVenueById(id).isVerified();
        venueService.verifyVenueById(id);
        if (isVerified){
            return "redirect:../../venues/verified";
        } else {
            return "redirect:../../venues/toVerify";
        }
    }

    @RequestMapping("/venue/delete/{id}")
    public String deleteVenue(@PathVariable Long id, Model model){
        boolean isVerified = venueService.findVenueById(id).isVerified();
        postService.deleteByVenueId(id);
        venueService.deleteVenueById(id);
        if (isVerified){
            return "redirect:../../venues/verified";
        } else {
            return "redirect:../../venues/toVerify";
        }
    }

}
