<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="es">

    <jsp:include page="WEB-INF/componentes/head.jsp" />
    

        <body>
            <jsp:include page="WEB-INF/componentes/menu.jsp" />

                <main>
                    <jsp:include page="WEB-INF/componentes/contenido-index.jsp" />
                        <jsp:include page="WEB-INF/componentes/form-oradores.jsp" />

                            <jsp:include page="WEB-INF/componentes/form-tickets.jsp" />
                </main>

                <footer>
                    <jsp:include page="WEB-INF/componentes/footer.jsp" />
                </footer>

                        <jsp:include page="WEB-INF/componentes/scripts.jsp" />
        </body>

    </html>