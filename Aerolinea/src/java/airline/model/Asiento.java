/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package airline.model;

/**
 *
 * @author AndreyCh
 */
public class Asiento {
    private String numero;
    private boolean estado;
    private Viaje viaje;

    public Asiento(String numero, boolean estado, Viaje viaje) {
        this.numero = numero;
        this.estado = estado;
        this.viaje = viaje;
    }
}
