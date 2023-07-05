<%--
    Document   : editar-orador
    Created on : 4 jul 2023, 20:23:37
    Author     : SGVero
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="dev.sgvero.confbsas.sgv.OradorDAO" %>
<%@ page import="dev.sgvero.confbsas.sgv.Orador" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="image/png" href="favicon.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <link rel="stylesheet" href="styles.css">
        <title>Conf Bs As - Editar Orador</title>
    </head>
    <body>

        <% 
            // Obtener el ID del orador desde el parámetro de la URL
            String idStr = request.getParameter("id");
            int id = Integer.parseInt(idStr);

            // Obtener el orador actual desde la base de datos
            OradorDAO oradorDAO = new OradorDAO();
            Orador orador = oradorDAO.getOradorById(id);
        
            if (orador != null) { // Agregado el bloque if
        %>
            
        <span class="link" id="form"></span>
            <section class="container mt-5 formulario">
                <h6>modifica los datos del orador</h6>
                <h3>orador</h3>
                <form action="OradorServlet?action=editar" method="post">
                    <input type="hidden" name="id" value="<%= orador.getId() %>">
                    <input type="text" name="nombre" value="<%= orador.getNombre() %>">
                    <input type="text" name="apellido" value="<%= orador.getApellido() %>">
                    <input class="temario" type="text" name="temario" value="<%= orador.getTemario() %>">
                    <span class="text-center form__nota">Revisa tus cambios antes de guardar</span>
                    <input type="submit" value="Guardar cambios">
                </form>
            </section>            
        <% } else { %>
        <p>Orador no encontrado</p>
        <% } %>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
                integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD"
        crossorigin="anonymous"></script>
        <script src="ticket.js"></script>
    </body>
</html>