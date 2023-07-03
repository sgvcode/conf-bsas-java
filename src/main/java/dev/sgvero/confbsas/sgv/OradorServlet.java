package dev.sgvero.confbsas.sgv;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/OradorServlet")
public class OradorServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String temario = request.getParameter("temario");

        // Guardar los valores en la base de datos
        OradorDAO oradorDAO = new OradorDAO();
        oradorDAO.guardarOrador(nombre, apellido, temario);

        // Redirigir a una página de confirmación o agradecimiento
        response.sendRedirect("lista-oradores.jsp");
    }
}