<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="es">

    <%@include file="componentes/head.jsp" %>

        <body>
            <%@include file="componentes/menu.jsp" %>

                <main>
                    <%@include file="componentes/contenido-index.jsp" %>
                        <%@include file="componentes/form-oradores.jsp" %>

                            <%@include file="componentes/form-tickets.jsp" %>
                </main>

                <footer>
                    <%@include file="componentes/footer.jsp" %>
                </footer>

                <%@include file="componentes/scripts.jsp" %>
        </body>

    </html>