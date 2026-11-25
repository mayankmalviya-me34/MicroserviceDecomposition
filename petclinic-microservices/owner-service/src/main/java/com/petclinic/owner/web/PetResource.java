package com.petclinic.owner.web;

import com.petclinic.owner.model.Pet;
import com.petclinic.owner.model.PetType;
import com.petclinic.owner.repository.PetTypeRepository;
import com.petclinic.owner.model.Owner;
import com.petclinic.owner.repository.OwnerRepository;
import com.petclinic.owner.repository.PetRepository;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.NoSuchElementException;

@RestController
@RequestMapping("/owners/{ownerId}/pets")
public class PetResource {

    private final PetRepository petRepository;
    private final OwnerRepository ownerRepository;
    private final PetTypeRepository petTypeRepository;

    public PetResource(PetRepository petRepository, OwnerRepository ownerRepository, PetTypeRepository petTypeRepository) {
        this.petRepository = petRepository;
        this.ownerRepository = ownerRepository;
        this.petTypeRepository = petTypeRepository;
    }

    @GetMapping
    public List<Pet> getPetsByOwner(@PathVariable Integer ownerId) {
        Owner owner = ownerRepository.findById(ownerId)
                .orElseThrow(() -> new RuntimeException("Owner not found: " + ownerId));
        return owner.getPets();
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Pet addPet(@PathVariable Integer ownerId,
                      @Valid @RequestBody Pet pet) {
        Owner owner = ownerRepository.findById(ownerId)
                .orElseThrow(() -> new RuntimeException("Owner not found: " + ownerId));

        if (pet.getType() != null && pet.getType().getName() != null) {
            PetType petType = petTypeRepository.findByName(pet.getType().getName())
                    .orElseThrow(() -> new RuntimeException("PetType not found: " + pet.getType().getName()));
            pet.setType(petType);
        }

        pet.setOwner(owner);
        owner.getPets().add(pet);
        ownerRepository.save(owner);
        return pet;
    }

    @GetMapping("/{petId}")
    public Pet getPet(@PathVariable Integer ownerId,
                      @PathVariable Integer petId) {
        return petRepository.findById(petId)
                .orElseThrow(() -> new NoSuchElementException("Pet not found: " + petId));
    }


    @PutMapping("/{petId}")
    public Pet updatePet(@PathVariable Integer ownerId,
                         @PathVariable Integer petId,
                         @Valid @RequestBody Pet pet) {
        Pet existingPet = petRepository.findById(petId)
                .orElseThrow(() -> new NoSuchElementException("Pet not found: " + petId));

        existingPet.setName(pet.getName());
        existingPet.setBirthDate(pet.getBirthDate());

        if (pet.getType() != null && pet.getType().getName() != null) {
            PetType petType = petTypeRepository.findByName(pet.getType().getName())
                    .orElseThrow(() -> new RuntimeException("PetType not found: " + pet.getType().getName()));
            existingPet.setType(petType);
        }

        return petRepository.save(existingPet);
    }


}