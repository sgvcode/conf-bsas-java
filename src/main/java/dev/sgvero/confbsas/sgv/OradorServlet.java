package dev.sgvero.confbsas.sgv;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/OradorServlet")
public class OradorServlet extends HttpServlet {

    private OradorDAO oradorDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        oradorDAO = new OradorDAO();
    }

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
            response.sendRedirect("lista-oradores.jsp");
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
        String foto = request.getParameter("foto");

        if (foto == null || foto.isEmpty()) {
            foto = "null-avatar.png";
        }

        oradorDAO.guardarOrador(nombre, apellido, temario, foto);

        response.sendRedirect("lista-oradores.jsp");
    }

    private void mostrarFormularioEdicion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

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
        String foto = request.getParameter("foto");

        Orador oradorActual = oradorDAO.getOradorById(id);

        if (oradorActual != null) {
            if (foto == null || foto.isEmpty()) {
                foto = oradorActual.getFoto();
            }

            oradorDAO.editarOrador(id, nombre, apellido, temario, foto);

            response.sendRedirect("lista-oradores.jsp");
        } else {
            // Orador no encontrado, redirigir o mostrar un mensaje - ver después
        }
    }

    private void borrarOrador(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        oradorDAO.borrarOrador(id);

        response.sendRedirect("lista-oradores.jsp");
    }
}
