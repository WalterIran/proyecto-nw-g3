
  <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">


<h1 class ="text-lg font-bold">Gestión de Usuarios</h1>
<hr>
<section class="WWList">
  <table class="min-w-full">
    <thead>
      <tr >
        <th >ID</th>
        <th >Nombre</th>
        <th >Género</th>
        <th>Teléfono</th>
        <th>Correo</th>
        <th>Dirección</th>
        <th>Status</th>
        <th>Rol</th>
        <th>Registrado</th>
        
        <th>
          {{if CanInsert}}
          <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded " id="btnAdd">Nuevo</button>
          {{endif CanInsert}}
        </th>
      </tr>
    </thead>

    <tbody class="bg-white">
      {{foreach ListaClientes}}
      <tr>
        <td>{{usercod}}</td>
        <td>
          <div class="text-sm font-medium leading-5 text-gray-900">
            <a href="index.php?page=mnt_cliente&mode=DSP&usercod={{usercod}}">{{username}}</a>
          </div>
        </td>
        <td>{{usergender}}</td>
        <td>{{userphone}}</td>
        <td>{{useremail}}</td>
        <td>{{useraddress}}</td>
        <td><span class="inline-flex px-2 text-xs font-semibold leading-5 text-green-800 bg-green-100 rounded-full">{{userest}}</span></td>
        <td><span class="inline-flex px-2 text-xs font-semibold leading-5 text-green-800 bg-green-100 rounded-full">{{userrole}}</span></td>
        <td>{{userfecharegistro}}</td>
        
       
        <td class="flex justify-items-center place-content-center">
          {{if ~CanUpdate}}
          
          <a href="index.php?page=mnt_cliente&mode=UPD&usercod={{usercod}}" title="Editar">
              <svg xmlns="http://www.w3.org/2000/svg" class="w-7 h-7 text-blue-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                  d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
                </svg>
          </a>
          {{endif ~CanUpdate}}
          &nbsp;
          {{if ~CanDelete}}
          <a href="index.php?page=mnt_cliente&mode=DEL&usercod={{usercod}}" title="Eliminar">
            <svg xmlns="http://www.w3.org/2000/svg" class="w-7 h-7 text-red-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                    d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
            </svg>
          </a>
          {{endif ~CanDelete}}
        </td>
      </tr>
      {{endfor ListaClientes}}
    </tbody>
  </table>
</section>
<script>
   document.addEventListener("DOMContentLoaded", function () {
      document.getElementById("btnAdd").addEventListener("click", function (e) {
        e.preventDefault();
        e.stopPropagation();
        window.location.assign("index.php?page=mnt_cliente&mode=INS");
      });
    });
</script>
