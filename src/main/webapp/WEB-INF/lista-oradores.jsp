<%-- Document : lista-oradores Created on : 2 jul 2023, 11:57:00 Author : SGVero --%>
<%@ page import="dev.sgvero.confbsas.sgv.OradorDAO" %>
<%@ page import="dev.sgvero.confbsas.sgv.Orador" %>
<%@ page import="java.util.List" %>

<jsp:include page="componentes/head.jsp" />
<jsp:include page="componentes/menu-o.jsp" />
    
        
    
    <main class="listado">
        <div class="listado__db">
            <h2>Lista de Oradores Inscriptos</h2>
        </div>
        <section class="popup__login" id="login">
            <form class="form-group">
                <input type="text" class="form-control" id="username" placeholder="Usuario">
                <input type="password" class="form-control" id="password" placeholder="Contraseña">
                <input class="enviar" id="submit" type="submit" value="Enviar" />
            </form>
        </section>
        <div class="d-flex justify-content-end w-100 mt-5 btn-pos">
            <a href="${pageContext.request.contextPath}/los-oradores?form=agregar" class="btn-orador-add">Agregar orador</a>
        </div>

        <div class="card-oradores row d-flex m-auto">
            <% OradorDAO oradorDAO=new OradorDAO(); List<Orador> oradores =
                oradorDAO.getOradores();
                for (Orador orador : oradores) { %>
            <div class="col-lg-4 col-sm-6">
                <div class="card mb-4">
                    <img src="${pageContext.request.contextPath}/<%= orador.getFotoPath() %>"
                         alt="Foto del orador" class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-nombre">
                            <%= orador.getNombre() + " " + orador.getApellido() %>
                        </h5>
                        <div class="temario-bloque">
                            <p class="card-temario">
                                <%= orador.getTemario() %>
                            </p>
                        </div>
                        <div class="botones-cards d-flex justify-content-end">
                            <a href="${pageContext.request.contextPath}/los-oradores?action=editar&id=<%= orador.getId() %>" class="btn-orador-edit btn-card">
                                <i class="fa-solid fa-pen-to-square"></i>
                            </a>
                            <a href="los-oradores?action=borrar&id=<%= orador.getId() %>"
                               onclick="return confirm('Estás seguro de que deseas borrar este orador?')"
                               class="btn-orador-del btn-card">
                                <i class="fa-solid fa-trash-can"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>
        </div>

    </main>

    <jsp:include page="componentes/footer.jsp" />

    <script>
        // Ir a la ultima posicion de la lista
        function scrollToListEnd() {
            const listaOradores = document.querySelector('.card-oradores');
            listaOradores.scrollTop = listaOradores.scrollHeight;
        }

        window.onload = function () {
            scrollToListEnd();
        };
    </script>

    <jsp:include page="componentes/scripts.jsp" />



</html>