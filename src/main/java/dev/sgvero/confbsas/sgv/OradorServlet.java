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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null) {
            if (action.equals("editar")) {
                mostrarFormularioEdicion(request, response);
            } else if (action.equals("borrar")) {
                borrarOrador(request, response);
            }
        } else {
            // Redirigir o mostrar un mensaje - ver después
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null && action.equals("editar")) {
            editarOrador(request, response);
        } else {
            agregarOrador(request, response);
        }
    }

    private void agregarOrador(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String temario = request.getParameter("temario");

        // Guardar los valores en la base de datos
        OradorDAO oradorDAO = new OradorDAO();
        oradorDAO.guardarOrador(nombre, apellido, temario);

        // Redirigir a listado de oradores
        response.sendRedirect("lista-oradores.jsp");
    }

    private void mostrarFormularioEdicion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        // Obtener el orador actual desde la base de datos
        OradorDAO oradorDAO = new OradorDAO();
        Orador orador = oradorDAO.getOradorById(id);

        if (orador != null) {
            request.setAttribute("orador", orador);
            request.getRequestDispatcher("editar-orador.jsp").forward(request, response);
        } else {
            // Orador no encontrado, redirigir o mostrar un mensaje - ver después
        }
    }

    private void editarOrador(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String temario = request.getParameter("temario");

        // Editar el orador en la base de datos
        OradorDAO oradorDAO = new OradorDAO();
        oradorDAO.editarOrador(id, nombre, apellido, temario);

        // Redirigir a la página del listado de oradores
        response.sendRedirect("lista-oradores.jsp");
    }

    private void borrarOrador(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        // Borrar el orador de la base de datos
        OradorDAO oradorDAO = new OradorDAO();
        oradorDAO.borrarOrador(id);

        // Redirigir a la página listado de oradores
        response.sendRedirect("lista-oradores.jsp");
    }
}
