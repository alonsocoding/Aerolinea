var arrayUsuarios;
var ciudad;
var aeropuerto;
var arrayCiudades;
var arrayAeropuertos;
let user;
function pageLoad(event) {
    crearBotones();
    addEventListeners();
    loadListUsuarios();
    loadListCiudades();
    loadListAeropuertos();
    ciudades();
    opciones();
}
function addEventListeners() {
    let correo= document.getElementById("correo");
    let password = document.getElementById("password");
    let aero_origen = document.getElementById("aero_origen");
    let aero_destino = document.getElementById("aero_destino");
    let fecha_ida = document.getElementById("fecha_ida");
    let fecha_regreso = document.getElementById("fecha_regreso");
    let ida = document.getElementById("ida");
    let vuelta = document.getElementById("vuelta");
    let pasajeros = document.getElementById("listPassengers");
    
   
	password.addEventListener("focus",doFocus);
	password.addEventListener("blur",doBlur); 
	correo.addEventListener("focus",doFocus);
	correo.addEventListener("blur",doBlur); 

    /*let formularioSesion = document.getElementById("formularioSesion");
    formularioSesion.addEventListener("submit", iniciarSesion);*/
    var incioSesionBoton= document.getElementById("inicioSesion");
    incioSesionBoton.addEventListener("click",iniciarSesion);
    var cerrarSesion= document.getElementById("cerrarSesion");
    cerrarSesion.addEventListener("click",cierraSesion);
    var buscar = document.getElementById("btn-search");
    buscar.addEventListener("click",buscar);
}
function doFocus(event){
	event.target.classList.add("focus");
}
function doBlur(event){
	event.target.classList.remove("focus");
}
/*-----------------------   PARTE DE BUSQUEDA DE VUELOS-------------------------------*/
function ciudades(){
    
        var ciudad1 = new Ciudad("SJO","San Jos�","Costa Rica");
        var ciudad2 = new Ciudad("MEX","Ciudad de M�xico","M�xico");
        var ciudad3 = new Ciudad("MIA","Miami","Estados Unidos");
        var ciudad4 = new Ciudad("MAD","Madrid","Espa�a");
        var ciudad5 = new Ciudad("ROM","Roma","Italia");
        var ciudad6 = new Ciudad("VIE","Viena","Austria");
        
        arrayCiudades.push(ciudad1);
        arrayCiudades.push(ciudad2);
        arrayCiudades.push(ciudad3);
        arrayCiudades.push(ciudad4);
        arrayCiudades.push(ciudad5);
        arrayCiudades.push(ciudad6);

}
function opciones(){
    var select  = document.getElementById("aero_origen");
    var select2 = document.getElementById("aero_destino");
    for(index in arrayCiudades) {
     select.options[select.options.length] = new Option(arrayCiudades[index],arrayCiudades[index]);
}
    for(index in arrayCiudades) {
    select2.options[select2.options.length] = new Option(arrayCiudades[index],arrayCiudades[index]);
}
}

function aeropuertos(){
        var aeropuerto1 = new Aeropuerto("SJO","Aeropuerto Internacional Juan Santamar�a",arrayCiudades[0]);
        var aeropuerto2 = new Aeropuerto("MEX","Aeropuerto Internacional Benito Ju�rez",arrayCiudades[1]);
        var aeropuerto3 = new Aeropuerto("MIA","Aeropuerto Internacional de Miami",arrayCiudades[2]);
        var aeropuerto4 = new Aeropuerto("MAD","Aeropuerto Adolfo Su�rez Madrid-Barajas",arrayCiudades[3]);
        var aeropuerto5 = new Aeropuerto("ROM","Aeropuerto Internacional Leonardo da Vinci",arrayCiudades[4]);
        var aeropuerto6 = new Aeropuerto("VIE","Aeropuerto Internacional de Viena",arrayCiudades[5]);
        
        arrayAeropuertos.push(aeropuerto1);
        arrayAeropuertos.push(aeropuerto2);
        arrayAeropuertos.push(aeropuerto3);
        arrayAeropuertos.push(aeropuerto4);
        arrayAeropuertos.push(aeropuerto5);
        arrayAeropuertos.push(aeropuerto6);
        
}
/*-----------------------PARTE DE INICIO DE SESION----------------------------------- */
function crearBotones(){
        let form = document.getElementById("formularioSesion");
        
        let input = document.createElement("input");
        input.setAttribute("id","correo");
        input.setAttribute("name","correo");
        input.setAttribute("placeholder","Email");
        input.setAttribute("class","form-control");
        input.setAttribute("type","text");
        form.appendChild(input);

        let input2 = document.createElement("input");
        input2.setAttribute("id","password");
        input2.setAttribute("name","password");
        input2.setAttribute("placeholder","contraseña");
        input2.setAttribute("class","form-control");
        input2.setAttribute("type","password");
        form.appendChild(input2);

        let button = document.createElement("button");
        button.setAttribute("id","inicioSesion");
        button.setAttribute("type","button");
        button.setAttribute("class","btn btn-success");
        let botonInicio= "Iniciar Sesion";
        button.innerHTML = botonInicio;
        form.appendChild(button);

        let a = document.createElement("a");
        a.setAttribute("href","registro.html");
        a.setAttribute("id","crearCuenta");
        a.setAttribute("type","button");
        a.setAttribute("class","btn btn-primary");
        let botonCrear= "Crear cuenta"
        a.innerHTML = botonCrear;
        form.appendChild(a);

        let button2 = document.createElement("button");
        button2.setAttribute("id","cerrarSesion");
        button2.setAttribute("type","button");
        button2.setAttribute("class","btn btn-danger");
        let botonInicio2= "Cerrar Sesion";
        button2.innerHTML = botonInicio2;
        form.appendChild(button2);

       cargarBotones();

}
function cargarBotones(){
    if(user!=1){ /*Nadie a iniciado sesion */
        document.getElementById("cerrarSesion").style.display = 'none';
    }else{
        document.getElementById("correo").style.display = 'none';
        document.getElementById("password").style.display = 'none';
        document.getElementById("crearCuenta").style.display = 'none';
        document.getElementById("inicioSesion").style.display = 'none';
        document.getElementById("cerrarSesion").style.display = 'initial';
    }
}
function loadListUsuarios() {
    arrayUsuarios = Storage.retrieve("Usuarios");
    if (arrayUsuarios == null) {
        arrayUsuarios = [];
        Storage.store("Usuarios", arrayUsuarios);
    }
}
function loadListCiudades() {
    arrayCiudades = Storage.retrieve("Ciudades");
    if (arrayCiudades == null) {
        arrayCiudades = [];
        Storage.store("Ciudades", arrayCiudades);
    }
}
function loadListAeropuertos() {
    arrayAeropuertos = Storage.retrieve("Aeropuertos");
    if (arrayAeropuertos == null) {
        arrayAeropuertos = [];
        Storage.store("Aeropuertos", arrayAeropuertos);
    }
}
function buscar(){
    
}
function iniciarSesion(){
    let correo= document.getElementById("correo");
    let password = document.getElementById("password");
    if(usuarioCorrecto(correo,password)){
        window.alert("Bienvenido");
        user=1;
        cargarBotones();
    }else{
        window.alert("error inicio de sesion");
    }
    
}
function cierraSesion(){
        document.getElementById("cerrarSesion").style.display = 'none';
        document.getElementById("correo").style.display = 'initial';
        document.getElementById("password").style.display = 'initial';
        document.getElementById("crearCuenta").style.display = 'initial';
        document.getElementById("inicioSesion").style.display = 'initial';

        document.getElementById("password").value ="";
        user=0;
}
function usuarioCorrecto(correo, password) {
    let index = arrayUsuarios.findIndex( ((est) => est.correo === correo.value) && ((est) => est.contrasena === password.value) );
        if(index != -1){
            return true;
        }
        return false;
}
/**----------------------------------------------------------------------------------------------- */
document.addEventListener("DOMContentLoaded", pageLoad)