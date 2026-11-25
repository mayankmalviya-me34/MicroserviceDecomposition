package com.petclinic.system;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.reactive.function.client.WebClient;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/owners/{ownerId}/pets")
public class PetController {

    private final WebClient webClient;

    public PetController(WebClient.Builder builder) {
        this.webClient = builder.baseUrl("http://localhost:8081").build();
    }

    @GetMapping("/new")
    public String initCreationForm(@PathVariable int ownerId, Model model) {
        Map owner = webClient.get().uri("/owners/" + ownerId)
                .retrieve().bodyToMono(Map.class).block();
        List types = webClient.get().uri("/petTypes")
                .retrieve().bodyToMono(List.class).block();
        PetForm form = new PetForm();
        form.setNew(true);
        model.addAttribute("owner", owner);
        model.addAttribute("pet", form);
        model.addAttribute("types", types);
        return "pets/createOrUpdatePetForm";
    }

    @PostMapping("/new")
    public String processCreationForm(@PathVariable int ownerId,
                                      @RequestParam Map<String, String> params) {
        java.util.HashMap<String, Object> body = new java.util.HashMap<>();
        body.put("name", params.get("name"));
        body.put("birthDate", params.get("birthDate"));
        // type ko object form mein bhejo
        java.util.HashMap<String, Object> typeMap = new java.util.HashMap<>();
        typeMap.put("name", params.get("type"));
        body.put("type", typeMap);

        webClient.post().uri("/owners/" + ownerId + "/pets")
                .contentType(org.springframework.http.MediaType.APPLICATION_JSON)
                .bodyValue(body)
                .retrieve().bodyToMono(Map.class).block();
        return "redirect:/owners/" + ownerId;
    }

    @GetMapping("/{petId}/edit")
    public String initUpdateForm(@PathVariable int ownerId,
                                 @PathVariable int petId, Model model) {
        Map owner = webClient.get().uri("/owners/" + ownerId)
                .retrieve().bodyToMono(Map.class).block();
        Map pet = webClient.get().uri("/owners/" + ownerId + "/pets/" + petId)
                .retrieve().bodyToMono(Map.class).block();
        List types = webClient.get().uri("/petTypes")
                .retrieve().bodyToMono(List.class).block();
        PetForm form = new PetForm();
        form.setNew(false);
        form.setId(pet.get("id") != null ? ((Number) pet.get("id")).intValue() : null);
        form.setName((String) pet.get("name"));
        form.setBirthDate((String) pet.get("birthDate"));
        Object typeObj = pet.get("type");
        if (typeObj instanceof Map) form.setType((String)((Map)typeObj).get("name"));
        model.addAttribute("owner", owner);
        model.addAttribute("pet", form);
        model.addAttribute("types", types);
        return "pets/createOrUpdatePetForm";
    }

    @PostMapping("/{petId}/edit")
    public String processUpdateForm(@PathVariable int ownerId,
                                    @PathVariable int petId,
                                    @RequestParam Map<String, String> params) {
        java.util.HashMap<String, Object> body = new java.util.HashMap<>();
        body.put("name", params.get("name"));
        body.put("birthDate", params.get("birthDate"));
        java.util.HashMap<String, Object> typeMap = new java.util.HashMap<>();
        typeMap.put("name", params.get("type"));
        body.put("type", typeMap);

        webClient.put().uri("/owners/" + ownerId + "/pets/" + petId)
                .contentType(org.springframework.http.MediaType.APPLICATION_JSON)
                .bodyValue(body)
                .retrieve().bodyToMono(Map.class).block();
        return "redirect:/owners/" + ownerId;
    }
}