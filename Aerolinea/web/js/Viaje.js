/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function Viaje(numero_viaje,fecha,avion,vuelo){
	this.Viaje(numero_viaje,fecha,avion,vuelo);
}
Viaje.prototype={
        numero_viaje: 0,
        fecha:"",
        avion:"",
        vuelo: 0,
	Viaje:function(numero_viaje,fecha,avion,vuelo){
		this.numero_viaje=numero_viaje;
                this.fecha=fecha;
		this.avion=avion;
		this.vuelo=vuelo;
	},
        toString:function(){
	  return this.numero_viaje;
	}
}
Viaje.from=function(plain){
    viaje = new Viaje(plain.numero_viaje,plain.fecha,plain.avion,plain.vuelo);
    return viaje;
};

Viaje.to= function(viaje){
    return{
         _class : 'Viaje',
         numero_viaje: viaje.numero_viaje,
         fecha: viaje.fecha,
         avion: viaje.avion,
         vuelo: viaje.vuelo
    };
};



