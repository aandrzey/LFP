package pl.lfp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import pl.lfp.domain.*;
import pl.lfp.domain.dto.CommentDto;
import pl.lfp.domain.dto.PostCityDto;
import pl.lfp.domain.dto.PostDto;
import pl.lfp.domain.dto.PostVenueDto;
import pl.lfp.security.CurrentUser;
import pl.lfp.service.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@SessionAttributes({"postDto"})
public class PostController {

    private PostService postService;
    private CityService cityService;
    private VenueService venueService;
    private GameService gameService;
    private GameTypeService gameTypeService;
    private CommentService commentService;

    @Autowired
    public PostController(PostService postService,
                          CityService cityService,
                          VenueService venueService,
                          GameService gameService,
                          GameTypeService gameTypeService,
                          CommentService commentService) {
        this.postService = postService;
        this.cityService = cityService;
        this.venueService = venueService;
        this.gameService = gameService;
        this.gameTypeService = gameTypeService;
        this.commentService = commentService;
    }


    @RequestMapping("/posts")
    public String showPosts(@RequestParam(defaultValue = "0") Integer pageSize,
                            @RequestParam(defaultValue = "0") Integer pageNumber,
                            @RequestParam(defaultValue = "") String city,
                            @RequestParam(defaultValue = "") String game,
                            @RequestParam(defaultValue = "") String dateString,
                            @RequestParam(defaultValue = "") String gameType,
                            Model model,
                            HttpSession session) {

        //Sprawdzenie i wybór iloścy wyświetlanych elementów na stronie
        if (session.getAttribute("pageSize") == null && pageSize == 0) {
            pageSize = 10;
            session.setAttribute("pageSize", pageSize);
        } else if (session.getAttribute("pageSize") != null && pageSize == 0) {
            pageSize = (Integer) session.getAttribute("pageSize");
        } else {
            session.setAttribute("pageSize", pageSize);
        }

        //Wstawienie dzisiejszej daty jeżeli nie ma wyszukiwania po dacie
        Date date;
        if ("".equals(dateString)) {
            date = new Date();
        } else {
            try {
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
                date = simpleDateFormat.parse(dateString);
            } catch (ParseException e) {
                e.printStackTrace();
                date = null;
            }
        }

        //Liczenie ilości pozycji do wyświetlenia
        Integer count = postService.countAllSearch(city, game, date, gameType);
        int pages;
        if (count % pageSize == 0) {
            pages = count / pageSize;
        } else {
            pages = count / pageSize + 1;
        }

        //Dodawanie elementów do modelu
        model.addAttribute("citySearch", city);
        model.addAttribute("gameSearch", game);
        model.addAttribute("dateSearch", dateString);
        model.addAttribute("gameTypeSearch", gameType);
        model.addAttribute("pages", pages);
        model.addAttribute("currentPage", pageNumber);
        model.addAttribute("posts", postService.findAllSearch(pageNumber, pageSize, city, game, date, gameType));
        return "posts";
    }


    @RequestMapping("/post")
    public String createPostPickCity(Model model, HttpSession session) {
        model.addAttribute("postCityDto", new PostCityDto());
        if (session.getAttribute("postDto") != null) {
            model.addAttribute("postDto", new PostDto());
        }
        return "post1";
    }

    @RequestMapping(value = "/post/venue", method = RequestMethod.POST)
    public String createPostPickVenue(@ModelAttribute PostCityDto postCityDto, Model model, BindingResult result, HttpSession session) {
        if (postCityDto.getCity() == null) {
            FieldError ssoError = new FieldError("postCityDto", "city", "Musisz wybrać miasto");
            result.addError(ssoError);
            return "post1";
        }
        Long cityId = postCityDto.getCity().getId();
        PostVenueDto postVenueDto = new PostVenueDto();
        postVenueDto.setCity(cityService.findById(cityId));
        PostDto postDto = (PostDto) session.getAttribute("postDto");
        if (session.getAttribute("postDto") == null) {
            postDto = new PostDto();
        }
        postDto.setCity(postVenueDto.getCity());
        model.addAttribute("postDto", postDto);
        model.addAttribute("postVenueDto", postVenueDto);
        model.addAttribute("venues", venueService.findAllVerifiedByCityId(cityId));
        return "post2";
    }

    @RequestMapping(value = "post/details", method = RequestMethod.POST)
    public String createPostDetails(@ModelAttribute PostVenueDto postVenueDto, Model model, BindingResult result, HttpSession session) {
        if (postVenueDto.getVenue().getId() == null && !postVenueDto.isPrivateVenue()) {
            FieldError ssoError = new FieldError("postVenueDto", "venue", "Musisz wybrać miejsce");
            result.addError(ssoError);
            return "post2";
        }
        if (postVenueDto.getPrivateVenueName().isEmpty() && postVenueDto.isPrivateVenue()) {
            FieldError ssoError = new FieldError("postVenueDto", "privateVenueName", "Musisz określić rodzaj miejsca np. dom, klub");
            result.addError(ssoError);
            return "post2";
        }
        PostDto postDto = (PostDto) session.getAttribute("postDto");
        if (session.getAttribute("postDto") == null) {
            postDto = new PostDto();
            postDto.setCity(postVenueDto.getCity());
        }
        postDto.setVenue(postVenueDto.getVenue());
        postDto.setPrivateVenue(postVenueDto.isPrivateVenue());
        if (postVenueDto.getPrivateVenueName().isEmpty()) {
            postDto.setPrivateVenueName(null);
        } else {
            postDto.setPrivateVenueName(postVenueDto.getPrivateVenueName());
        }
        model.addAttribute("postDto", postDto);
        return "post3";
    }

    @RequestMapping(value = "/post/final", method = RequestMethod.POST)
    public String createPostFinal(@ModelAttribute @Valid PostDto postDto,
                                  BindingResult result,
                                  @AuthenticationPrincipal CurrentUser currentUser) {
        if (result.hasErrors()) {
            return "post3";
        }
        Post post = new Post();
        post.setGame(postDto.getGame());
        post.setDescription(postDto.getDescription());
        post.setCity(postDto.getCity());
        post.setVenue(postDto.getVenue());
        post.setPrivateVenue(postDto.isPrivateVenue());
        post.setPrivateVenueName(postDto.getPrivateVenueName());
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        try {
            post.setDateStart(simpleDateFormat.parse(postDto.getDateStart() + " " + postDto.getTimeStart()));
            post.setDateStop(simpleDateFormat.parse(postDto.getDateStop() + " " + postDto.getTimeStop()));
        } catch (ParseException e) {
            e.printStackTrace();
        }

        post.setGameType(postDto.getGameType());
        post.setUser(currentUser.getUser());
        postService.save(post);
        return "redirect:../user";
    }

    @RequestMapping("/post/delete/{id}")
    public String deletePost(@AuthenticationPrincipal CurrentUser currentUser, @PathVariable Long id) {
        Post post = postService.findById(id);
        if (currentUser.getAuthorities().stream().anyMatch(item -> item.getAuthority().equals("ROLE_ADMIN")) ||
                currentUser.getUser().getId().equals(post.getUser().getId())) {
            postService.deleteById(id);
            return "redirect:../../user";
        }
        return "redirect:../../posts/" + id;
    }

    @RequestMapping("/posts/{postId}")
    public String postDetails(@PathVariable Long postId, Model model) {
        model.addAttribute("post", postService.findById(postId));
        model.addAttribute("commentDto", new CommentDto());
        return "postDetails";
    }

    @RequestMapping(value = "/posts/{postId}/comment", method = RequestMethod.POST)
    public String postAddComment(@PathVariable Long postId,
                                 @ModelAttribute @Valid CommentDto commentDto,
                                 BindingResult result,
                                 @AuthenticationPrincipal CurrentUser currentUser,
                                 Model model) {
        if (result.hasErrors()) {
            model.addAttribute("post", postService.findById(postId));
            return "postDetails";
        }
        Comment comment = new Comment();
        comment.setContent(commentDto.getContent());
        comment.setPost(postService.findById(postId));
        comment.setUser(currentUser.getUser());
        commentService.save(comment);
        return "redirect:/posts/" + postId;
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
