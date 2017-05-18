/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package airline.model;
import java.io.Serializable;
/**
 *
 * @author AndreyCh
 */
public class Viaje implements Serializable, Jsonable{
    int numero_viaje;
    Avion avion;
    Vuelo vuelo;

    public Viaje(int numero_viaje, Avion avion, Vuelo vuelo) {
        this.numero_viaje = numero_viaje;
        this.avion = avion;
        this.vuelo = vuelo;
    }

    public Viaje() {
    }

    public int getNumero_viaje() {
        return numero_viaje;
    }

    public Avion getAvion() {
        return avion;
    }

    public Vuelo getVuelo() {
        return vuelo;
    }

    public void setNumero_viaje(int numero_viaje) {
        this.numero_viaje = numero_viaje;
    }

    public void setAvion(Avion avion) {
        this.avion = avion;
    }

    public void setVuelo(Vuelo vuelo) {
        this.vuelo = vuelo;
    }
    
}
