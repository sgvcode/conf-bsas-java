<%-- 
    Document   : lista-oradores
    Created on : 2 jul 2023, 11:57:00
    Author     : SGVero
--%>

<%@ page import="dev.sgvero.confbsas.sgv.OradorDAO" %>
<%@ page import="dev.sgvero.confbsas.sgv.Orador" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="image/png" href="favicon.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="styles.css">
        <title>Conf Bs As - Lista de Oradores</title>
    </head>

    <body>
        <menu class="container-fluid m-auto p-0">
            <nav class="navbar navbar-expand-lg navbar-dark">
                <div class="container-fluid">
                    <a class="navbar-brand" href="index.html">
                        <img src="img/codoacodo.png" alt="" width="90" class="d-inline-block align-text-middle">
                        Conf Bs As
                    </a>
                    <div class="form-login">
                        <button class="login" type="button" onclick="ingresar()">Ingresar</button>
                    </div>
                </div>
            </nav>
        </menu>

        <main class="listado">
            <section class="listado__db">
                <h2>Lista de Oradores Inscriptos</h2>
            </section>
            <section class="popup__login" id="login">
                <form class="form-group">
                    <input type="text" class="form-control" id="username" placeholder="Usuario">
                    <input type="password" class="form-control" id="password" placeholder="Contraseña">
                    <input class="enviar" id="submit" type="submit" value="Enviar" />
                </form>
            </section>
            <div class="d-flex justify-content-end mt-5 mx-5">
                <a href="agregar-orador.jsp" class="btn-orador-add">Agregar orador</a>
            </div>
            <section class="my-5 mx-5">
                <%
                 OradorDAO oradorDAO = new OradorDAO();
                 List<Orador> oradores = oradorDAO.getOradores();
                 for (Orador orador : oradores) {
                %>
                <p class="oradores bg-light px-2 small">Nombre: <span class="text-secondary fw-bold fst-italic"><%= orador.getNombre() %></span></p>
                <p class="oradores bg-light px-2 small">Apellido: <span class="text-secondary fw-bold fst-italic"><%= orador.getApellido() %></span></p>
                <p class="oradores bg-light px-2 small">Temario: <span class="text-secondary fw-bold fst-italic"><%= orador.getTemario() %></span></p>
                <div class="gap-2 d-flex justify-content-end">
                    <a href="editar-orador.jsp?id=<%= orador.getId() %>" class="btn-orador-edit">Editar</a>
                    <a href="OradorServlet?action=borrar&id=<%= orador.getId() %>" class="btn-orador-del">Borrar</a>
                </div>
                <hr>
                <%
                    }
                %>
            </section>
        </main>

        <footer class="container-fluid py-4">
            <div class="row">
                <span class="col"></span>
                <ul class="list-inline col-10 text-center">
                    <li class="list-inline-item col"><a href="#">Preguntas frecuentes</a></li>
                    <li class="list-inline-item col"><a href="#">Contáctanos</a></li>
                    <li class="list-inline-item col"><a href="#">Prensa</a></li>
                    <li class="list-inline-item col"><a href="#">Conferencias</a></li>
                    <li class="list-inline-item col"><a href="#">Términos y condiciones</a></li>
                    <li class="list-inline-item col"><a href="#">Privacidad</a></li>
                    <li class="list-inline-item col"><a href="#">Estudiantes</a></li>
                </ul>
                <span class="col"></span>
            </div>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
        <script src="ticket.js"></script>
    </body>

</html>