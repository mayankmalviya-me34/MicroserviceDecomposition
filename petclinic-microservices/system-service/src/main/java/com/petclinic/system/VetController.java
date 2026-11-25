package com.petclinic.system;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.reactive.function.client.WebClient;

import java.util.List;

@Controller
public class VetController {

    private final WebClient webClient;

    public VetController(WebClient.Builder builder) {
        this.webClient = builder.baseUrl("http://localhost:8082").build();
    }

    @GetMapping("/vets.html")
    public String showVetList(Model model) {
        List vets = webClient.get().uri("/vets")
                .retrieve().bodyToMono(List.class).block();
        model.addAttribute("listVets", vets);
        model.addAttribute("totalPages", 1);
        model.addAttribute("currentPage", 1);
        return "vets/vetList";
    }
}