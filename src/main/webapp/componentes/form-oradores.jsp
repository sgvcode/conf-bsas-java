<%@page contentType="text/html" pageEncoding="UTF-8" %>

    <span class="link" id="form"></span>
    <section class="formulario">
        <h6>conviértete en un</h6>
        <h3>orador</h3>
        <p>Anótate como orador para dar una <a href="#">charla ignite</a>. Cuéntanos de qué quieres
            hablar!
        </p>
        <form method="POST" action="OradorServlet" onsubmit="return validateForm()">
            <input type="text" name="nombre" id="nombre" placeholder="Nombre" required />
            <input type="text" name="apellido" id="apellido" placeholder="Apellido" required />
            <textarea name="temario" id="comentario" placeholder="Sobre qué quieres hablar?"></textarea>
            <input type="file" name="foto" id="foto" accept="img/*" />
            <span class="form__nota">Recuerda incluir un título para tu charla</span>
            <input id="submit" type="submit" value="Enviar" />
        </form>
    </section>