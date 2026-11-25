package com.petclinic.system;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.reactive.function.client.WebClient;

import java.util.List;
import java.util.Map;

@Controller
public class OwnerController {

    private final WebClient webClient;

    public OwnerController(WebClient.Builder builder) {
        this.webClient = builder.baseUrl("http://localhost:8081").build();
    }

    @GetMapping("/owners/find")
    public String findOwners(Model model) {
        model.addAttribute("owner", new OwnerSearchForm());
        return "owners/findOwners";
    }

    @GetMapping("/owners/new")
    public String initCreationForm(Model model) {
        OwnerForm form = new OwnerForm();
        form.setNew(true);
        model.addAttribute("owner", form);
        return "owners/createOrUpdateOwnerForm";
    }

    @GetMapping("/owners/search")
    public String processFindForm(
            @RequestParam(required = false) String lastName,
            Model model) {
        if (lastName == null) lastName = "";
        String url = lastName.isBlank()
                ? "/owners"
                : "/owners?lastName=" + lastName;
        List owners = webClient.get().uri(url)
                .retrieve().bodyToMono(List.class).block();
        if (owners == null || owners.isEmpty()) {
            OwnerSearchForm form = new OwnerSearchForm();
            form.setLastName(lastName);
            model.addAttribute("owner", form);
            return "owners/findOwners";
        }
        if (owners.size() == 1) {
            Map owner = (Map) owners.get(0);
            return "redirect:/owners/" + owner.get("id");
        }
        model.addAttribute("listOwners", owners);
        model.addAttribute("totalPages", 1);
        model.addAttribute("currentPage", 1);
        return "owners/ownersList";
    }

    @GetMapping("/owners/{ownerId}")
    public String showOwner(@PathVariable int ownerId, Model model) {
        Map owner = webClient.get().uri("/owners/" + ownerId)
                .retrieve().bodyToMono(Map.class).block();
        System.out.println("=== OWNER JSON: " + owner);
        model.addAttribute("owner", owner);
        return "owners/ownerDetails";
    }

    @PostMapping("/owners/new")
    public String processCreationForm(@RequestParam Map<String, String> params) {
        java.util.HashMap<String, Object> body = new java.util.HashMap<>();
        body.put("firstName", params.get("firstName"));
        body.put("lastName", params.get("lastName"));
        body.put("address", params.get("address"));
        body.put("city", params.get("city"));
        body.put("telephone", params.get("telephone"));

        Map result = webClient.post().uri("/owners")
                .contentType(org.springframework.http.MediaType.APPLICATION_JSON)
                .bodyValue(body)
                .retrieve().bodyToMono(Map.class).block();
        return "redirect:/owners/" + result.get("id");
    }

    @GetMapping("/owners/{ownerId}/edit")
    public String initUpdateForm(@PathVariable int ownerId, Model model) {
        Map owner = webClient.get().uri("/owners/" + ownerId)
                .retrieve().bodyToMono(Map.class).block();
        OwnerForm form = new OwnerForm();
        form.setNew(false);
        form.setFirstName((String) owner.get("firstName"));
        form.setLastName((String) owner.get("lastName"));
        form.setAddress((String) owner.get("address"));
        form.setCity((String) owner.get("city"));
        form.setTelephone((String) owner.get("telephone"));
        model.addAttribute("owner", form);
        return "owners/createOrUpdateOwnerForm";
    }

@PostMapping("/owners/{ownerId}/edit")
public String processUpdateForm(@PathVariable int ownerId,
                                @RequestParam Map<String, String> params) {
    java.util.HashMap<String, Object> body = new java.util.HashMap<>();
    body.put("firstName", params.get("firstName"));
    body.put("lastName", params.get("lastName"));
    body.put("address", params.get("address"));
    body.put("city", params.get("city"));
    body.put("telephone", params.get("telephone"));

    webClient.put().uri("/owners/" + ownerId)
            .contentType(org.springframework.http.MediaType.APPLICATION_JSON)
            .bodyValue(body)
            .retrieve().bodyToMono(Map.class).block();
    return "redirect:/owners/" + ownerId;
}
}