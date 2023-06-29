// // Codigo optimizado con categorias agrupadas
// const botonesCategoria = {
//   estudiante: document.getElementById('estudianteBtn'),
//   trainee: document.getElementById('traineeBtn'),
//   junior: document.getElementById('juniorBtn')
// };
// const categoriaSelect = document.getElementById('categoria');
// const cantidadInput = document.getElementById('cantidad');
// const resumenBtn = document.getElementById('resumenBtn');
// const totalPagar = document.getElementById('totalPagar');
// const descuentos = { estudiante: 0.8, trainee: 0.5, junior: 0.15 };

// document.getElementById('comprar__ticket').addEventListener('submit', (event) => {
//   event.preventDefault();
//   actualizarTotal();
// });

// cantidadInput.addEventListener('change', () => {
//   if (parseFloat(cantidadInput.value) < 0) cantidadInput.value = "";
// });

// function formularioCompleto() {
//   return document.getElementById('nombreN').value !== '' && cantidadInput.value !== '';
// }

// function activarBoton(categoria) {
//   Object.values(botonesCategoria).forEach(boton => boton.classList.remove('button-active'));
//   botonesCategoria[categoria].classList.add('button-active');
// }

// function actualizarTotal() {
//   const categoria = categoriaSelect.value;
//   const cantidad = parseFloat(cantidadInput.value);
//   const descuento = descuentos[categoria] || 0;
//   const total = cantidad * 200 * (1 - descuento);

//   activarBoton(categoria);
//   totalPagar.innerHTML = isNaN(total) || total <= 0 ? 'Total a pagar: $' : `Total a pagar: $${total.toFixed(0)}`;
// }

// Object.entries(botonesCategoria).forEach(([categoria, boton]) => {
//   boton.addEventListener('click', () => {
//     categoriaSelect.value = categoria;
//     actualizarTotal();
//   });
// });

// categoriaSelect.addEventListener('change', actualizarTotal);
// cantidadInput.addEventListener('input', actualizarTotal);
// actualizarTotal();

// resumenBtn.addEventListener('click', () => {
//   if (formularioCompleto()) {
//     const nombre = document.getElementById('nombreN').value;
//     const cantidad = cantidadInput.value;
//     const totalPagarTexto = totalPagar.textContent;
//     const categoria = categoriaSelect.options[categoriaSelect.selectedIndex].text;
//     const mensaje = `Hola ${nombre.toUpperCase()}!\nElegiste comprar '${cantidad}' ticket(s)\ncomo '${categoria}'\n\n${totalPagarTexto}`;

//     const popup = document.createElement('div');
//     popup.classList.add('popup');
//     popup.textContent = mensaje;
//     document.body.appendChild(popup);
//     setTimeout(() => popup.remove(), 3600);
//   } else {
//     alert("Por favor, completa los datos en el formulario.");
//   }
// });

// document.getElementById('resetBtn').addEventListener('click', () => {
//   document.getElementById('comprar__ticket').reset();
//   totalPagar.innerHTML = 'Total a pagar: $';
//   Object.values(botonesCategoria).forEach(boton => boton.classList.remove('button-active'));
// });

// --------------------------------------------------------------------------

document.addEventListener('DOMContentLoaded', function () {

  const estudianteBtn = document.getElementById('estudianteBtn');
  const traineeBtn = document.getElementById('traineeBtn');
  const juniorBtn = document.getElementById('juniorBtn');
  const categoriaSelect = document.getElementById('categoria');
  const cantidadInput = document.getElementById('cantidad');
  const resumenBtn = document.getElementById('resumenBtn');
  const totalPagar = document.getElementById('totalPagar');

  document.getElementById('comprar__ticket').addEventListener('submit', function (event) {
    event.preventDefault();

    const categoria = categoriaSelect.value;
    const cantidad = parseFloat(cantidadInput.value);
    let descuento = 0;

    if (categoria === 'estudiante') {
      descuento = 0.8;
    } else if (categoria === 'trainee') {
      descuento = 0.5;
    } else if (categoria === 'junior') {
      descuento = 0.15;
    }

    const total = cantidad * 200 * (1 - descuento);

    totalPagar.textContent = total > 0 ? `Total a pagar: $${total.toFixed(0)}` : 'Total a pagar: $';
  });

  cantidadInput.addEventListener('change', function () {
    const cantidad = parseFloat(cantidadInput.value);
    if (cantidad < 0) {
      cantidadInput.value = '';
    }
  });

  function formularioCompleto() {
    const nombre = document.getElementById('nombreN').value;
    const cantidad = cantidadInput.value;
    return nombre !== '' && cantidad !== '';
  }

  function activarBoton(boton) {
    estudianteBtn.classList.remove('button-active');
    traineeBtn.classList.remove('button-active');
    juniorBtn.classList.remove('button-active');
    boton.classList.add('button-active');
  }

  function actualizarTotal() {
    const categoria = categoriaSelect.value;
    const cantidad = parseFloat(cantidadInput.value);
    let descuento = 0;

    if (categoria === 'estudiante') {
      descuento = 0.8;
      activarBoton(estudianteBtn);
    } else if (categoria === 'trainee') {
      descuento = 0.5;
      activarBoton(traineeBtn);
    } else if (categoria === 'junior') {
      descuento = 0.15;
      activarBoton(juniorBtn);
    }

    const total = cantidad * 200 * (1 - descuento);

    if (isNaN(total) || total <= 0) {
      totalPagar.textContent = 'Total a pagar: $';
    } else {
      totalPagar.textContent = `Total a pagar: $${total.toFixed(0)}`;
    }
  }

  estudianteBtn.addEventListener('click', function () {
    categoriaSelect.value = 'estudiante';
    activarBoton(estudianteBtn);
    actualizarTotal();
  });

  traineeBtn.addEventListener('click', function () {
    categoriaSelect.value = 'trainee';
    activarBoton(traineeBtn);
    actualizarTotal();
  });

  juniorBtn.addEventListener('click', function () {
    categoriaSelect.value = 'junior';
    activarBoton(juniorBtn);
    actualizarTotal();
  });

  categoriaSelect.addEventListener('change', function () {
    actualizarTotal();
  });

  cantidadInput.addEventListener('input', function () {
    actualizarTotal();
  });

  actualizarTotal();

  resumenBtn.addEventListener('click', function () {
    if (formularioCompleto()) {
      const nombre = document.getElementById('nombreN').value;
      const cantidad = cantidadInput.value;
      const categoria = categoriaSelect.options[categoriaSelect.selectedIndex].text;

      const mensaje = `Hola ${nombre.toUpperCase()}!\nElegiste comprar '${cantidad}' ticket(s)\ncomo '${categoria}'\n\n${totalPagar.textContent}`;

      const popup = document.createElement('div');
      popup.classList.add('popup');
      popup.textContent = mensaje;

      document.body.appendChild(popup);

      setTimeout(function () {
        popup.remove();
      }, 3500);
    } else {
      alert('Por favor, completa los datos en el formulario.');
    }
  });

  document.getElementById('resetBtn').addEventListener('click', function () {
    document.getElementById('comprar__ticket').reset();
    totalPagar.textContent = 'Total a pagar: $';

    estudianteBtn.classList.remove('button-active');
    traineeBtn.classList.remove('button-active');
    juniorBtn.classList.remove('button-active');
  });

});