package com.petclinic.owner.web;

import com.petclinic.owner.model.PetType;
import com.petclinic.owner.repository.PetTypeRepository;
import org.springframework.format.Formatter;
import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.util.List;
import java.util.Locale;
import java.util.NoSuchElementException;

@Component
public class PetTypeFormatter implements Formatter<PetType> {

    private final PetTypeRepository petTypeRepository;

    public PetTypeFormatter(PetTypeRepository petTypeRepository) {
        this.petTypeRepository = petTypeRepository;
    }

    @Override
    public String print(PetType petType, Locale locale) {
        return petType.getName();
    }

    @Override
    public PetType parse(String text, Locale locale) throws ParseException {
        List<PetType> allTypes = petTypeRepository.findAll();
        return allTypes.stream()
                .filter(pt -> pt.getName().equals(text))
                .findFirst()
                .orElseThrow(() -> new NoSuchElementException("PetType not found: " + text));
    }
}