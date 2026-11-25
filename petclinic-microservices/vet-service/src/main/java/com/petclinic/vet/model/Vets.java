package com.petclinic.vet.model;

import jakarta.xml.bind.annotation.XmlElement;
import jakarta.xml.bind.annotation.XmlRootElement;
import java.util.ArrayList;
import java.util.List;

@XmlRootElement
public class Vets {
    private List<Vet> vets = new ArrayList<>();

    @XmlElement
    public List<Vet> getVetList() { return vets; }
    public void setVetList(List<Vet> vets) { this.vets = vets; }
}