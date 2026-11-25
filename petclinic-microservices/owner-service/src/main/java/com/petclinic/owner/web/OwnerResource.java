package com.petclinic.owner.web;

import com.petclinic.owner.model.Owner;
import com.petclinic.owner.repository.OwnerRepository;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.NoSuchElementException;

@RestController
@RequestMapping("/owners")
public class OwnerResource {

    private final OwnerRepository ownerRepository;

    // Constructor manually
    public OwnerResource(OwnerRepository ownerRepository) {
        this.ownerRepository = ownerRepository;
    }

    @GetMapping
    public List<Owner> getAllOwners(
            @RequestParam(required = false) String lastName) {
        if (lastName != null && !lastName.isBlank()) {
            return ownerRepository.findByLastNameStartingWith(lastName);
        }
        return ownerRepository.findAll();
    }

    @GetMapping("/{ownerId}")
    public Owner getOwner(@PathVariable Integer ownerId) {
        return ownerRepository.findById(ownerId)
                .orElseThrow(() -> new NoSuchElementException("Owner not found: " + ownerId));
    }


    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Owner createOwner(@RequestBody Owner owner) {
        return ownerRepository.save(owner);
    }

    @PutMapping("/{ownerId}")
    public Owner updateOwner(@PathVariable Integer ownerId,
                             @Valid @RequestBody Owner owner) {
        owner.setId(ownerId);
        return ownerRepository.save(owner);
    }
}