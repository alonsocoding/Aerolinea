<%-- 
    Document   : horas
    Created on : May 18, 2017, 12:26:26 AM
    Author     : AndreyCh
--%>

<%@page import="airline.model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Baratísimo</title>
        <%@ include file="Imports.jspf" %> 
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </head>
    <body>
        <%@ include file="HeaderAdmi.jspf" %>
        <!--Side Bar and content -->
        <div class="container">
            <fieldset>
                <legend align="center">Menu Administrativo</legend>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-8 col-md-10 main">
                            <h1 class="page-header">Ciudades</h1>
                            <div class="form-group">
                                <label class="control-label">Codigo</label><input type="text" class ="form-control" id="codigo" placeholder="Ingrese codigo de la ciudad"><br>
                                <label class="control-label">Pais</label><input type="text" class ="form-control" id="pais" placeholder="Ingrese pais de la ciudad"> <br>
                                <label class="control-label">Nombre</label><input type="text" class ="form-control" id="nombre" placeholder="Ingrese nombre de la ciudad"> <br>
                                <button onclick='controller.CiudadesAdd();' class="btn btn-success" id="agregarRuta">Agregar</button>
                                <button class="btn btn-warning" id="limpiarRuta">Limpiar</button>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover">
                                    <thead class="thead-inverse">
                                        <tr>
                                            <th>Codigo</th>
                                            <th>Pais</th>
                                            <th>Nombre</th>
                                            <th>Editar</th>
                                            <th>Eliminar</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tablaCiudades">
                                        <!-- Contenido de la tabla -->
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <hr>
                <br>
            </fieldset>
        </div>
        <!-- Footer -->
        <div class="container">
            <footer class="footer">
                <p>&copy; 2017 Baratisimo, Inc.</p>
            </footer>
        </div>


        <script> // Model
            function Model() {
                this.Model();
            }

            Model.prototype = {
                Model: function () {
                    this.ciudades = [];
                }
            };
        </script>
        <script> // Controller
            function Controller(model, view) {
                this.Controller(model, view);
            }

            Controller.prototype = {
                Controller: function (model, view) {
                    this.model = model;
                    this.view = view;
                    Proxy.getCiudades(function (result) {
                        model.ciudades = result;
                        view.showCiudades();
                    });
                    this.initCiudades();
                },
                initCiudades: function () {
                    var model = this.model;
                    model.ciudad = new Ciudad();
                },
                CiudadesAdd: function () {
                    var model = this.model;
                    var view = this.view;
                    this.model.ciudad.codigo = this.view.document.getElementById("codigo").value;
                    this.model.ciudad.pais = this.view.document.getElementById("pais").value;
                    this.model.ciudad.nombre = this.view.document.getElementById("nombre").value;
                    Proxy.CiudadAdd(this.model.ciudad, function (result) {
                        model.ciudad.codigo = result;
                        document.location = "/Aerolinea/ciudades.jsp"
                        view.showMessage();
                    });

                },
                doDelete: function (codigo) {
                    Proxy.CiudadDelete(codigo, function (result) {
                        model.ciudad.codigo = result;
                        document.location = "/Aerolinea/ciudades.jsp"
                        view.showMessageDelete();
                    });
                },
                /*doUpdate: function () {
                    var model = this.model;
                    var view = this.view;
                    this.model.ciudad.codigo = this.view.document.getElementById("codigo").value;
                    this.model.ciudad.pais = this.view.document.getElementById("pais").value;
                    this.model.ciudad.nombre = this.view.document.getElementById("nombre").value;
                    Proxy.CiudadAdd(this.model.ciudad, function (result) {
                        model.ciudad.codigo = result;
                        document.location = "/Aerolinea/ciudades.jsp"
                        view.showMessageUpdate();
                    });
                }*/

            };
        </script>
        <script> // View
            var model;
            var controller;
            function pageLoad(event) {
                model = new Model();
                controller = new Controller(model, window);
                showCiudades();
            }


            function showCiudades() {

                var tr;
                var tabla;
                var td;
                var img;
                for (var index in model.ciudades) {
                    // ----------Agregar nueva fila----------------
                    tabla = document.getElementById("tablaCiudades");
                    tr = document.createElement("tr");
                    td = document.createElement("td");
                    td.appendChild(document.createTextNode(model.ciudades[index].codigo));
                    tr.appendChild(td);
                    td = document.createElement("td");
                    td.appendChild(document.createTextNode(model.ciudades[index].pais));
                    tr.appendChild(td);
                    td = document.createElement("td");
                    td.appendChild(document.createTextNode(model.ciudades[index].nombre));
                    tr.appendChild(td);
                    
                    td= document.createElement("td");
                    img= document.createElement("img");
                    img.src="images/edit.png";
                    img.title="Editar"
                    //img.addEventListener("click", function(e){doUpdate();});
                    td.appendChild(img);
                    tr.appendChild(td);

                    td= document.createElement("td");
                    img= document.createElement("img");
                    img.src="images/delete.png";
                    img.title="Eliminar"
                    img.addEventListener("click", function(e){controller.doDelete(model.ciudades[index].codigo);});
                    td.appendChild(img);
                    tr.appendChild(td);
                    
                    tabla.appendChild(tr);

                }

            }
            function showMessage() {
                window.alert("Registro exitoso");
            }
            function showMessageDelete() {
                window.alert("Eliminacion exitosa");
            }

            document.addEventListener("DOMContentLoaded", pageLoad);
        </script>
    </body>
</html>
