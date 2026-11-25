package com.petclinic.owner.dto;

import java.time.LocalDate;

public class VisitDTO {
    private Integer id;
    private LocalDate date;
    private String description;
    private Integer petId;

    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }
    public LocalDate getDate() { return date; }
    public void setDate(LocalDate date) { this.date = date; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public Integer getPetId() { return petId; }
    public void setPetId(Integer petId) { this.petId = petId; }
}