
function Usuario(usuario,contrasena,nombre,apellidos,correo,fecha_nac,direccion,telf_trabajo,celular,tipo){ 
  this.Usuario(usuario,contrasena,nombre,apellidos,correo,fecha_nac,direccion,telf_trabajo,celular,tipo);
}

Usuario.prototype={ 
  Usuario: function(usuario,contrasena,nombre,apellidos,correo,fecha_nac,direccion,telf_trabajo,celular,tipo){
        this.usuario=usuario;
	this.contrasena=contrasena;
        this.nombre=nombre;
	this.apellidos=apellidos;
	this.correo=correo;
	this.fecha_nac=fecha_nac;
	this.direccion=direccion;
	this.telf_trabajo=telf_trabajo;
	this.celular=celular;
        this.tipo=tipo;
  }
}