package com.petclinic.system;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.reactive.function.client.WebClient;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/owners/{ownerId}/pets/{petId}/visits")
public class VisitController {

    private final WebClient webClient;

    public VisitController(WebClient.Builder builder) {
        this.webClient = builder.baseUrl("http://localhost:8081").build();
    }

    @GetMapping("/new")
    public String initNewVisitForm(@PathVariable int ownerId,
                                   @PathVariable int petId, Model model) {
        Map owner = webClient.get().uri("/owners/" + ownerId)
                .retrieve().bodyToMono(Map.class).block();
        Map pet = webClient.get().uri("/owners/" + ownerId + "/pets/" + petId)
                .retrieve().bodyToMono(Map.class).block();
        VisitForm form = new VisitForm();
        form.setNew(true);
        model.addAttribute("owner", owner);
        model.addAttribute("pet", pet);
        model.addAttribute("visit", form);
        return "pets/createOrUpdateVisitForm";
    }

    @PostMapping("/new")
    public String processNewVisitForm(@PathVariable int ownerId,
                                      @PathVariable int petId,
                                      @ModelAttribute VisitForm visitForm) {

        java.util.HashMap<String, Object> body = new java.util.HashMap<>();
        body.put("visitDate", visitForm.getDate());
        body.put("description", visitForm.getDescription());

        webClient.post()
                .uri("/owners/" + ownerId + "/pets/" + petId + "/visits")
                .contentType(org.springframework.http.MediaType.APPLICATION_JSON)
                .bodyValue(body)
                .retrieve().bodyToMono(Map.class).block();
        return "redirect:/owners/" + ownerId;
    }
}