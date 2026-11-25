package com.petclinic.owner.repository;

import com.petclinic.owner.model.PetType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.Optional;

@Repository
public interface PetTypeRepository extends JpaRepository<PetType, Integer> {
    Optional<PetType> findByName(String name);
}