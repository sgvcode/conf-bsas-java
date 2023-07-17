package dev.sgvero.confbsas.sgv;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

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
        } else if (request.getParameter("form") != null && request.getParameter("form").equals("agregar")) {
            mostrarFormularioAgregar(request, response);
        } else {
            mostrarListaOradores(request, response);
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

    private void mostrarListaOradores(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Orador> oradores = oradorDAO.getOradores();
        request.setAttribute("oradores", oradores);
        request.getRequestDispatcher("/WEB-INF/lista-oradores.jsp").forward(request, response);
    }

    private void mostrarFormularioAgregar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/agregar-orador.jsp").forward(request, response);
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

        response.sendRedirect(request.getContextPath() + "/OradorServlet");
    }

    private void mostrarFormularioEdicion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        Orador orador = oradorDAO.getOradorById(id);

        if (orador != null) {
            request.setAttribute("orador", orador);
            String path = "/WEB-INF/editar-orador.jsp";
            request.getRequestDispatcher(path).forward(request, response);
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

            String path = "/WEB-INF/lista-oradores.jsp";
            request.getRequestDispatcher(path).forward(request, response);
        } else {
            // Orador no encontrado, redirigir o mostrar un mensaje - ver después
        }
    }

    private void borrarOrador(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        oradorDAO.borrarOrador(id);

        String path = "/WEB-INF/lista-oradores.jsp";
        request.getRequestDispatcher(path).forward(request, response);
    }
}