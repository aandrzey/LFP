package pl.lfp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.lfp.domain.City;
import pl.lfp.domain.Venue;
import pl.lfp.domain.dto.VenueDto;
import pl.lfp.service.CityService;
import pl.lfp.service.VenueService;

import javax.validation.Valid;
import java.util.List;

@Controller
public class VenueController {

    private VenueService venueService;
    private CityService cityService;

    @Autowired
    public VenueController(VenueService venueService, CityService cityService) {
        this.venueService = venueService;
        this.cityService = cityService;
    }

    @RequestMapping("/venue")
    public String createVenue(Model model){
        model.addAttribute("venueDto", new VenueDto());
        return "venue";
    }

    @RequestMapping(value = "/venue", method = RequestMethod.POST)
    public String createVenue(@ModelAttribute @Valid VenueDto venueDto, BindingResult result){
        if (result.hasErrors()){
            return "venue";
        }
        Venue venue = new Venue();
        venue.setName(venueDto.getName());
        venue.setCity(venueDto.getCity());
        venue.setAddress(venueDto.getAddress());
        venueService.save(venue);
        return "redirect:/user";
    }

    @ModelAttribute(name = "cities")
    List<City> populateCities() {
        return cityService.getCitiesSorted();
    }
}
