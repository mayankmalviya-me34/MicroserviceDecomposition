package com.petclinic.vet.web;

import com.petclinic.vet.model.Vet;
import com.petclinic.vet.model.Vets;
import com.petclinic.vet.repository.VetRepository;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import com.petclinic.vet.model.Specialty;
import com.petclinic.vet.repository.SpecialtyRepository;
import java.util.NoSuchElementException;
import java.util.Set;

import java.util.List;

@RestController
@RequestMapping("/vets")
public class VetResource {

    private final VetRepository vetRepository;
    private final SpecialtyRepository specialtyRepository;

    public VetResource(VetRepository vetRepository, SpecialtyRepository specialtyRepository) {
        this.vetRepository = vetRepository;
        this.specialtyRepository = specialtyRepository;
    }

    @GetMapping
    public List<Vet> getAllVets() {
        return vetRepository.findAll();
    }

    @GetMapping("/{vetId}")
    public Vet getVet(@PathVariable Integer vetId) {
        return vetRepository.findById(vetId)
                .orElseThrow(() -> new NoSuchElementException("Vet not found: " + vetId));
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Vet createVet(@RequestBody Vet vet) {
        return vetRepository.save(vet);
    }

    @GetMapping("/{vetId}/specialties")
    public Set<Specialty> getVetSpecialties(@PathVariable int vetId) {
        Vet vet = vetRepository.findById(vetId)
                .orElseThrow(() -> new NoSuchElementException("Vet not found: " + vetId));
        return vet.getSpecialties();
    }

    @PostMapping("/{vetId}/specialties/{specialtyId}")
    public Vet addSpecialty(@PathVariable int vetId,
                            @PathVariable int specialtyId) {
        Vet vet = vetRepository.findById(vetId)
                .orElseThrow(() -> new NoSuchElementException("Vet not found: " + vetId));
        Specialty specialty = specialtyRepository.findById(specialtyId)
                .orElseThrow(() -> new NoSuchElementException("Specialty not found: " + specialtyId));
        vet.getSpecialties().add(specialty);
        return vetRepository.save(vet);
    }

    @DeleteMapping("/{vetId}/specialties/{specialtyId}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void removeSpecialty(@PathVariable int vetId,
                                @PathVariable int specialtyId) {
        Vet vet = vetRepository.findById(vetId)
                .orElseThrow(() -> new NoSuchElementException("Vet not found: " + vetId));
        vet.getSpecialties().removeIf(s -> s.getId() == specialtyId);
        vetRepository.save(vet);
    }
}