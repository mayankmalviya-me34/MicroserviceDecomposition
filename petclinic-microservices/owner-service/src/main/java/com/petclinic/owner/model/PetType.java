package com.petclinic.owner.model;

import com.petclinic.model.NamedEntity;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "pet_types")
public class PetType extends NamedEntity {
}