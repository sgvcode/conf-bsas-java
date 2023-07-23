<%@page contentType="text/html" pageEncoding="UTF-8" %>

    <span class="link" id="form"></span>
    <section class="formulario formulario__ticket" id="ticket">
        <article class="grid__tickets">
            <button id="estudianteBtn" class="box__ticket blue">
                <h4>Estudiante</h4>
                <p>Tienen un descuento</p>
                <h5>80%</h5>
                <h6>* presentar documentación</h6>
            </button>
            <button id="traineeBtn" class="box__ticket green">
                <h4>Trainee</h4>
                <p>Tienen un descuento</p>
                <h5>50%</h5>
                <h6>* presentar documentación</h6>
            </button>
            <button id="juniorBtn" class="box__ticket orange">
                <h4>Junior</h4>
                <p>Tienen un descuento</p>
                <h5>15%</h5>
                <h6>* presentar documentación</h6>
            </button>
        </article>
        <h6>venta</h6>
        <h3>VALOR DEL TICKET $200</h3>
        <form method="POST" action="" id="comprar__ticket">
            <input type="text" name="nombre" id="nombreN" placeholder="Nombre" required />
            <input type="text" name="apellido" id="apellidoN" placeholder="Apellido" required />
            <input type="email" name="email" id="email" placeholder="Correo" required />
            <div class="form__rows">
                <label for="cantidad">Cantidad</label>
                <label for="categoria">Categoría</label>
            </div>
            <input type="number" name="cantidad" id="cantidad" placeholder="cantidad" required />
            <select name="categoria" id="categoria" required>
                <option value="estudiante">Estudiante</option>
                <option value="trainee">Trainee</option>
                <option value="junior">Junior</option>
            </select>

            <p class="salida" id="totalPagar">Total a pagar: $</p>

            <div class="form-btns">
                <input id="resetBtn" type="reset" value="Borrar" />
                <input id="resumenBtn" type="submit" value="Resumen" />
            </div>
        </form>
    </section>