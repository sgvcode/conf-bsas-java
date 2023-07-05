<%-- 
    Document   : oradores
    Created on : 4 jul 2023, 14:32:59
    Author     : SGVero
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="image/png" href="favicon.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <link rel="stylesheet" href="styles.css">
        <title>Conf Bs As - Lista de Oradores</title>
    </head>

    <body>
        <span class="link" id="form"></span>
            <section class="formulario">
                <h6>conviértete en un</h6>
                <h3>orador</h3>
                <p>Anótate como orador para dar una <a href="#">charla ignite</a>. Cuéntanos de qué quieres hablar!</p>
                <form method="POST" action="OradorServlet">
                    <input type="text" name="nombre" id="nombre" placeholder="Nombre" required />
                    <input type="text" name="apellido" id="apellido" placeholder="Apellido" required />
                    <textarea name="temario" id="comentario" placeholder="Sobre qué quieres hablar?"></textarea>
                    <span class="form__nota">Recuerda incluir un título para tu charla</span>
                    <input id="submit" type="submit" value="Enviar" />
                </form>
            </section>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
                integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD"
        crossorigin="anonymous"></script>
        <script src="ticket.js"></script>
    </body>

</html>

