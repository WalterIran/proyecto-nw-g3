<!-- component -->
 <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
<div class="overflow-x-auto">
  <div class="min-w-screen flex items-center justify-center font-sans overflow-hidden">
    <div class="w-full">
    <h1 class="text-3xl py-4 border-b mb-10">Gestión de Productos</h1>
    {{if CanInsert}}
          <button class="bg-green-900 hover:bg-green-600 text-white font-bold py-2 px-4 rounded " id="btnAdd">Nuevo</button>
    {{endif CanInsert}}
    <div class="bg-white shadow-md rounded my-6">
      <table class="min-w-max w-full table-auto">
        <thead>
          <tr class="bg-gray-200 text-gray-600 uppercase text-sm leading-normal">
              <th class="py-3 px-6 text-left">ID</th>
              <th class="py-3 px-6 text-left">Producto</th>
              <th class="py-3 px-6 text-center">Proveedor</th>
              <th class="py-3 px-6 text-center">Imagén</th>
              <th class="py-3 px-6 text-center">Descripción</th>
              <th class="py-3 px-6 text-center">Precio (L)</th>
              <th class="py-3 px-6 text-center">Acciones</th>
          </tr>
        </thead>
        <tbody class="text-gray-600 text-sm font-light">
          {{foreach product}}
          <tr class="border-b border-gray-200 hover:bg-gray-100">
            <td class="py-3 px-6 text-left whitespace-nowrap">{{id}}</td>
            <td class="py-3 px-6 text-left">{{name}}</td>
            <td class="py-3 px-6 text-center">{{provider}}</td>
            <td class="py-3 px-6 text-center"><a href="{{img}}" target="_blank">{{img}}</a></td>
            <td class="py-3 px-6 text-center">{{description}}</td>
            <td class="py-3 px-6 text-center">{{price}}</td>
                <!--Botones de acciones-->
            <td class="py-3 px-6 text-center">
                  <div class="flex item-center justify-center">
                    <!--CanView-->
                    <div class="w-4 mr-2 transform hover:text-green-600 hover:scale-110">
                      <a href="index.php?page=mnt_product&mode=DSP&id={{id}}">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                        </svg>
                      </a>
                    </div>
                    <!--CanView-->

                    <!--CanUpdate-->
                    {{if ~CanUpdate}}
                    <div class="w-4 mr-2 transform hover:text-green-600 hover:scale-110">
                      <a href="index.php?page=mnt_product&mode=UPD&id={{id}}" title="Editar">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                        </svg>
                      </a>
                    </div>
                    {{endif ~CanUpdate}}
                    <!--CanUpdate-->
                    
                    <!--CanDelete-->
                    {{if ~CanDelete}}
                    <div class="w-4 mr-2 transform hover:text-green-600 hover:scale-110">
                      <a href="index.php?page=mnt_product&mode=DEL&id={{id}}" title="Eliminar">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                        </svg>
                      </a>
                    </div>
                    <!--CanDelete-->
                    {{endif ~CanDelete}}
                  </div>
              </td>
              <!--Botones de acciones-->
          </tr>
            {{endfor product}}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
</div>

<script>
   document.addEventListener("DOMContentLoaded", function () {
      document.getElementById("btnAdd").addEventListener("click", function (e) {
        e.preventDefault();
        e.stopPropagation();
        window.location.assign("index.php?page=mnt_product&mode=INS");
      });
    });
</script>