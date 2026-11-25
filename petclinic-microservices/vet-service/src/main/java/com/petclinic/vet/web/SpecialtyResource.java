package com.petclinic.vet.web;

import com.petclinic.vet.model.Specialty;
import com.petclinic.vet.repository.SpecialtyRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.NoSuchElementException;

@RestController
@RequestMapping("/specialties")
public class SpecialtyResource {

    private final SpecialtyRepository specialtyRepository;

    public SpecialtyResource(SpecialtyRepository specialtyRepository) {
        this.specialtyRepository = specialtyRepository;
    }

    @GetMapping
    public List<Specialty> getAllSpecialties() {
        return specialtyRepository.findAll();
    }

    @GetMapping("/{id}")
    public Specialty getSpecialty(@PathVariable int id) {
        return specialtyRepository.findById(id)
                .orElseThrow(() -> new NoSuchElementException("Specialty not found: " + id));
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Specialty createSpecialty(@RequestBody Specialty specialty) {
        return specialtyRepository.save(specialty);
    }

    @PutMapping("/{id}")
    public Specialty updateSpecialty(@PathVariable int id, @RequestBody Specialty specialty) {
        Specialty existing = specialtyRepository.findById(id)
                .orElseThrow(() -> new NoSuchElementException("Specialty not found: " + id));
        existing.setName(specialty.getName());
        return specialtyRepository.save(existing);
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteSpecialty(@PathVariable int id) {
        specialtyRepository.deleteById(id);
    }
}