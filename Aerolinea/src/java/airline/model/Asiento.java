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
public class Asiento implements Serializable, Jsonable{
    String numero;
    boolean estado;
    Viaje viaje;


    public Asiento(String numero, boolean estado, Viaje viaje) {
        this.numero = numero;
        this.estado = estado;
        this.viaje = viaje;
    }
    
    public Asiento() {
    }


    public String getNumero() {
        return numero;
    }

    public boolean isEstado() {
        return estado;
    }

    public Viaje getViaje() {
        return viaje;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public void setEstado(boolean estado) {
        this.estado = estado;
    }

    public void setViaje(Viaje viaje) {
        this.viaje = viaje;
    }

    
}
