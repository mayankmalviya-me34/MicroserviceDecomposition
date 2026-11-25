package com.petclinic.system;

public class PetForm {
    private Integer id;
    private String name = "";
    private String birthDate = "";
    private String type = "";
    private boolean isNew = true;

    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getBirthDate() { return birthDate; }
    public void setBirthDate(String birthDate) { this.birthDate = birthDate; }
    public String getType() { return type; }
    public void setType(String type) { this.type = type; }
    public boolean isNew() { return isNew; }
    public void setNew(boolean isNew) { this.isNew = isNew; }
}