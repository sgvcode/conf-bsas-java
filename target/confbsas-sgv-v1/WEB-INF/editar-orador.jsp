<%-- Document : oradores Created on : 4 jul 2023, 14:32:59 Author : SGVero --%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="dev.sgvero.confbsas.sgv.OradorDAO" %>
<%@ page import="dev.sgvero.confbsas.sgv.Orador" %>


<jsp:include page="componentes/head.jsp" />
<body>
    <section>
        <%
            // Obtener el ID del orador desde el parÃ¡metro de la URL
            String idStr = request.getParameter("id");
            int id = Integer.parseInt(idStr);

            // Obtener el orador actual desde la base de datos
            OradorDAO oradorDAO = new OradorDAO();
            Orador orador = oradorDAO.getOradorById(id);

            if (orador != null) {
        %>
        <span class="link" id="form"></span>
        <section class="container mt-5 formulario">
            <h6>modifica los datos del orador</h6>
            <h3>"<%= orador.getNombre()%> <%= orador.getApellido() %>"</h3>
            <%-- Mostrar la foto actual --%>
            <div class="editar-foto">
                <img id="vista-previa" src="<%= orador.getFotoPath() %>" alt="Vista previa de la foto" width="300" height="300">
            </div>
            <form id="form-edicion" action="${pageContext.request.contextPath}/los-oradores?action=editar" method="post" onsubmit="return guardarCambios()">
                <input type="hidden" name="id" value="<%= orador.getId() %>">
                <input type="text" name="nombre" value="<%= orador.getNombre() %>">
                <input type="text" name="apellido" value="<%= orador.getApellido() %>">
                <input class="temario" type="text" name="temario" value="<%= orador.getTemario() %>">
                <div class="mb-3">
                    <label for="foto" class="form-label">Imagen</label>
                    <div class="input-group">
                        <input type="file" class="m-auto" id="foto" name="foto" accept="image/*" onchange="mostrarVistaPrevia()">
                        <%-- Mostrar el nombre del archivo seleccionado --%>
                        <span id="nombre-archivo"></span>
                    </div>
                </div>
                <span class="text-center form__nota">Revisa tus cambios antes de guardar</span>
                <input type="submit" name="action" value="Guardar cambios">
            </form>
        </section>
        <% 
            } else { 
        %>
        <p>Orador no encontrado</p>
        <% 
            } 
        %>
    </section>

    <script>

        var fotoActual = "<%= orador.getFotoPath() %>";

        function mostrarVistaPrevia() {
            var archivo = document.getElementById('foto').files[0];
            var vistaPrevia = document.getElementById('vista-previa');

            if (archivo) {
                var lector = new FileReader();
                lector.onload = function (e) {
                    vistaPrevia.src = e.target.result;
                }
                lector.readAsDataURL(archivo);
            } else {
                vistaPrevia.src = fotoActual;
            }
        }

        function guardarCambios() {
            var form = document.getElementById('form-edicion');
            var formData = new FormData(form);

            var xhr = new XMLHttpRequest();
            xhr.open('POST', form.action);
            xhr.onreadystatechange = function () {
                if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                    // Actualizar la vista previa de la foto con la nueva imagen
                    var nuevaFoto = JSON.parse(xhr.responseText).foto;
                    var vistaPrevia = document.getElementById('vista-previa');
                    vistaPrevia.src = nuevaFoto;
                }
            }
            xhr.send(formData);
        }

    </script>

    <jsp:include page="componentes/scripts.jsp" />
</body>