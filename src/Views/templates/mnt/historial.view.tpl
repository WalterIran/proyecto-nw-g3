<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
<h1 class ="text-lg font-bold">Historial</h1>
<section class="WWFilter">

</section>
<section class="WWList">
  <table class="min-w-full">
    <thead>
      <tr>
        <th>Fecha</th>
        <th>Producto</th>
        <th>Cantidad</th>
        <th>Total</th>
      </tr>
    </thead>

    <tbody class="bg-white">
      {{foreach ListaProductosCliente}}
      <tr>
        <td>{{fechacompra}}</td>
        <td>{{productodes}}</td>
        <td>{{productocan}}</td>
        <td>{{total}}</td>
        
      </tr>
      {{endfor ListaProductosCliente}}
    </tbody>
  </table>
</section>

