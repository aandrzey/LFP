package pl.lfp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.lfp.domain.Game;
import pl.lfp.service.GameService;
import pl.lfp.service.PostService;

import java.util.List;

@Controller
public class HomeController {

    private GameService gameService;
    private PostService postService;

    @Autowired
    public HomeController(GameService gameService, PostService postService) {
        this.gameService = gameService;
        this.postService = postService;
    }

    @RequestMapping("/")
    public String showHome(Model model) {
        List<Game> games = gameService.findAll();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < games.size(); i++) {
            sb.append("'").
                    append(games.get(i).getName()).
                    append("', ").
                    append(postService.findAllByGameName(games.get(i).getName()).size());
                    //append("]");
            if (i != games.size() - 1) {
                sb.append(";");
            }
        }
        model.addAttribute("chartData", sb.toString());
        return "index";
    }
}
