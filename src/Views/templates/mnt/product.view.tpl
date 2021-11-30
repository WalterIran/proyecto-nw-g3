<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
<div class="grid justify-center items-center">
    <div class="w-11/12 p-12 bg-white">
    <h1 class="text-xl font-semibold">{{mode_dsc}}</h1>
    <form class="mt-6" action="index.php?page=mnt_product&mode={{mode}}&id={{id}}" method="POST">
        <div class="flex justify-between gap-3">
            <span class="w-1/2">
            <label for="id" class="block text-xs font-semibold text-gray-600 uppercase">Código</label>
            <input class="block w-full p-3 mt-2 text-gray-700 bg-gray-200 appearance-none focus:outline-none focus:bg-gray-300 focus:shadow-inner" type="text" id="id" name="id" value="{{id}}" readonly/>
            <input class="text-input" type="hidden" id="mode" name="mode" value="{{mode}}" />
            <input class="text-input" type="hidden" readonly name="iddummy" value="{{id}}"/>
            </span>
            <span class="w-1/2">
            <label for="name" class="block text-xs font-semibold text-gray-600 uppercase">Producto</label>
            <input type="text" {{readonly}} name="name" value="{{name}}" placeholder="Nombre del producto" class="block w-full p-3 mt-2 text-gray-700 bg-gray-200 appearance-none focus:outline-none focus:bg-gray-300 focus:shadow-inner" required />
            </span>
        </div>
        <labelclass="block mt-2 text-xs font-semibold text-gray-600 uppercase" for="provider">Proveedor</label>
        <input class="block w-full p-3 mt-2 text-gray-700 bg-gray-200 appearance-none focus:outline-none focus:bg-gray-300 focus:shadow-inner" type="text" {{readonly}} name="provider" value="{{provider}}" placeholder="Proveedor"/>
      
        <label class="block mt-2 text-xs font-semibold text-gray-600 uppercase" for="img">Imagén</label>
        <input class="block w-full p-3 mt-2 text-gray-700 bg-gray-200 appearance-none focus:outline-none focus:bg-gray-300 focus:shadow-inner" type="text" {{readonly}} name="img" value="{{img}}" placeholder="Imagen del producto"/>
      
        <label class="block mt-2 text-xs font-semibold text-gray-600 uppercase" for="description">Descripción</label>
        <input class="block w-full p-3 mt-2 text-gray-700 bg-gray-200 appearance-none focus:outline-none focus:bg-gray-300 focus:shadow-inner" type="text" {{readonly}} name="description" value="{{description}}" placeholder="Descripción"/>

        <label class="block mt-2 text-xs font-semibold text-gray-600 uppercase" for="price">Precio (Lempiras)</label>
        <input class="block w-full p-3 mt-2 text-gray-700 bg-gray-200 appearance-none focus:outline-none focus:bg-gray-300 focus:shadow-inner" type="text" {{readonly}} name="price" value="{{price}}" placeholder="Precio"/>
      
        {{if hasErrors}}
        <section>
            <ul>
                {{foreach Errors}}
                <li>{{this}}</li>
                {{endfor Errors}}
            </ul>
        </section>
        {{endif hasErrors}}

        {{if showaction}}
            <button type="submit" class="w-full py-3 mt-6 font-medium tracking-widest text-white uppercase bg-black shadow-lg focus:outline-none hover:bg-gray-900 hover:shadow-none" name="btnGuardar" value="G">Guardar</button>
        {{endif showaction}}
            <button type="button" class="w-full py-3 mt-6 font-medium tracking-widest text-white uppercase bg-black shadow-lg focus:outline-none hover:bg-gray-900 hover:shadow-none" id="btnCancelar">Cancelar</button>
    </form>
  </div>
</div>

<script>
  document.addEventListener("DOMContentLoaded", function(){
      document.getElementById("btnCancelar").addEventListener("click", function(e){
        e.preventDefault();
        e.stopPropagation();
        window.location.assign("index.php?page=mnt_products");
      });
  });
</script>