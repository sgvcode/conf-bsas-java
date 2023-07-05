<%-- 
    Document   : borrar-oradores
    Created on : 4 jul 2023, 20:26:49
    Author     : SGVero
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="dev.sgvero.confbsas.sgv.OradorDAO" %>
<%@ page import="dev.sgvero.confbsas.sgv.Orador" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Borrar Orador</title>
</head>
<body>
    <h1>Borrar Orador</h1>
    
    <% 
        String idStr = request.getParameter("id");
        int id = Integer.parseInt(idStr);
        
        OradorDAO oradorDAO = new OradorDAO();
        Orador orador = oradorDAO.getOradorById(id);
        
        if (orador != null) {
    %>
        <p>Nombre: <%= orador.getNombre() %></p>
        <p>Apellido: <%= orador.getApellido() %></p>
        <p>Temario: <%= orador.getTemario() %></p>
        
        <form action="OradorServlet?action=borrar" method="post">
            <input type="hidden" name="id" value="<%= orador.getId() %>">
            <input type="submit" value="Confirmar Borrado">
        </form>
    <% } else { %>
        <p>Orador no encontrado</p>
    <% } %>
</body>
</html>
