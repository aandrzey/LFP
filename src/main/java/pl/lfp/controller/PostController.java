package pl.lfp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import pl.lfp.domain.City;
import pl.lfp.domain.Game;
import pl.lfp.domain.GameType;
import pl.lfp.domain.dto.PostDto;
import pl.lfp.service.*;

import javax.validation.Valid;
import java.util.List;

@Controller
public class PostController {

    private PostService postService;
    private CityService cityService;
    private VenueService venueService;
    private GameService gameService;
    private GameTypeService gameTypeService;

    @Autowired
    public PostController(PostService postService,
                          CityService cityService,
                          VenueService venueService,
                          GameService gameService,
                          GameTypeService gameTypeService) {
        this.postService = postService;
        this.cityService = cityService;
        this.venueService = venueService;
        this.gameService = gameService;
        this.gameTypeService = gameTypeService;
    }


    @RequestMapping("/posts")
    public String showPosts(@RequestParam(defaultValue = "0") Integer pageNumber,
                            @RequestParam(defaultValue = "10") Integer pageSize,
                            Model model) {
        model.addAttribute("posts", postService.findAll(pageNumber, pageSize));
        return "posts";
    }

    @RequestMapping("/post")
    public String createPostPickCity(Model model) {
        model.addAttribute("postDto", new PostDto());
        return "post1";
    }

    @RequestMapping(value = "/post/venue", method = RequestMethod.GET)
    public String createPostPickVenue(@ModelAttribute PostDto postDto, Model model) {
        model.addAttribute("postDto", postDto);
        //model.addAttribute("venues", venueService.findAllVerifiedByCityId(cityId));
        return "post2";
    }

    @ModelAttribute(name = "cities")
    List<City> populateCities() {
        return cityService.getCitiesSorted();
    }

    @ModelAttribute(name = "games")
    List<Game> populateGames() {
        return gameService.findAll();
    }

    @ModelAttribute(name = "gameTypes")
    List<GameType> populateGameTypes() {
        return gameTypeService.findAll();
    }
}
