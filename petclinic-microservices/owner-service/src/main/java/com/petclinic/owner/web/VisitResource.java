package com.petclinic.owner.web;

import com.petclinic.owner.model.Visit;
import com.petclinic.owner.repository.VisitRepository;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/owners/{ownerId}/pets/{petId}/visits")
public class VisitResource {

    private final VisitRepository visitRepository;

    public VisitResource(VisitRepository visitRepository) {
        this.visitRepository = visitRepository;
    }

    @GetMapping
    public List<Visit> getVisits(@PathVariable Integer petId) {
        return visitRepository.findByPetId(petId);
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Visit addVisit(@PathVariable Integer petId,
                          @RequestBody Visit visit) {
        visit.setPetId(petId);
        return visitRepository.save(visit);
    }
}