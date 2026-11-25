package com.petclinic.system;

public class VisitForm {
    private String date = "";
    private String description = "";
    private boolean isNew = true;

    public String getDate() { return date; }
    public void setDate(String date) { this.date = date; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public boolean isNew() { return isNew; }
    public void setNew(boolean isNew) { this.isNew = isNew; }
}