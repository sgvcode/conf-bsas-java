<%-- Document : lista-oradores Created on : 2 jul 2023, 11:57:00 Author : SGVero --%>

    <%@ page import="dev.sgvero.confbsas.sgv.OradorDAO" %>
        <%@ page import="dev.sgvero.confbsas.sgv.Orador" %>
            <%@ page import="java.util.List" %>
                <!DOCTYPE html>
                <html lang="es">

                <%@include file="componentes/head.jsp" %>

                    <body>
                        <menu class="container-fluid m-auto p-0">
                            <nav class="navbar navbar-expand-lg navbar-dark">
                                <div class="container-fluid">
                                    <a class="navbar-brand" href="index.jsp">
                                        <img src="img/codoacodo.png" alt="" width="90"
                                            class="d-inline-block align-text-middle">
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
                                    <input type="password" class="form-control" id="password" placeholder="Contraseï¿½a">
                                    <input class="enviar" id="submit" type="submit" value="Enviar" />
                                </form>
                            </section>
                            <div class="d-flex justify-content-end w-100 mt-5 btn-pos">
                                <a href="agregar-orador.jsp" class="btn-orador-add">Agregar orador</a>
                            </div>
                            <section class="bloque-lista">
                                <% OradorDAO oradorDAO=new OradorDAO(); List<Orador> oradores = oradorDAO.getOradores();
                                    for (Orador orador : oradores) {
                                    %>
                                    <div class="bloque-orador mb-2">
                                        <img src="${pageContext.request.contextPath}/<%= orador.getFotoPath() %>"
                                            alt="Foto del orador" width="150" height="150">
                                    </div>
                                    <div class="bloque-datos">
                                        <div class="bloque-orador">
                                            <code class="oradores px-1">
                        <span class="blockquote text-secondary fw-bold fst-italic">
                            <%= orador.getNombre() %>
                            <%= orador.getApellido() %>
                        </span>
                    </code>
                                        </div>
                                        <div class="bloque-orador">
                                            <code class="oradores px-1">
                        <span class="text-secondary fw-bold fst-italic">
                            <%= orador.getTemario() %>
                        </span>
                    </code>
                                        </div>
                                        <div class="gap-2 d-flex banda-editar justify-content-end pe-2">
                                            <a href="editar-orador.jsp?id=<%= orador.getId() %>"
                                                class="btn-orador-edit">
                                                <i class="fa-solid fa-pen-to-square"></i>
                                            </a>
                                            <!-- Agrega la funciï¿½n de confirmaciï¿½n para el borrado -->
                                            <a href="OradorServlet?action=borrar&id=<%= orador.getId() %>"
                                                onclick="return confirm('Estás seguro de que deseas borrar este orador?')"
                                                class="btn-orador-del">
                                                <i class="fa-solid fa-trash-can"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <hr>
                                    <% } %>
                            </section>

                        </main>
                        <%@include file="componentes/footer.jsp" %>

                            <script>
                                // Funciï¿½n para desplazarse automï¿½ticamente a la ï¿½ltima posiciï¿½n de la lista
                                function scrollToListEnd() {
                                    const listaOradores = document.querySelector('.bloque-lista');
                                    listaOradores.scrollTop = listaOradores.scrollHeight;
                                }

                                // Desplazarse automï¿½ticamente a la ï¿½ltima posiciï¿½n despuï¿½s de cargar la pï¿½gina
                                window.onload = function () {
                                    scrollToListEnd();
                                };
                            </script>

                            <%@include file="componentes/scripts.jsp" %>

                    </body>

                </html>