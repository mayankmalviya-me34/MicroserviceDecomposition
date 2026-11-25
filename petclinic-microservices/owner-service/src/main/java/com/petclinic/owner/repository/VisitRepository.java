package com.petclinic.owner.repository;

import com.petclinic.owner.model.Visit;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface VisitRepository extends JpaRepository<Visit, Integer> {

    @Query("SELECT v FROM Visit v WHERE v.petId = :petId")
    List<Visit> findByPetId(Integer petId);
}