package com.petclinic.owner.web;

import com.petclinic.owner.model.PetType;
import com.petclinic.owner.repository.PetTypeRepository;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/petTypes")
public class PetTypeResource {

    private final PetTypeRepository petTypeRepository;

    public PetTypeResource(PetTypeRepository petTypeRepository) {
        this.petTypeRepository = petTypeRepository;
    }

    @GetMapping
    public List<PetType> getAllPetTypes() {
        return petTypeRepository.findAll();
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public PetType createPetType(@RequestBody PetType petType) {
        return petTypeRepository.save(petType);
    }
}