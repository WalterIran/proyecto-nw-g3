 <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
<h1 class ="text-lg font-bold" >{{mode_dsc}}</h1>
<section>
  {{if isDEL}}
  <div class="flex items-center " role="alert">
    <div class ="flex items-center p-4 bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative">
      <svg class="m-1 w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"></path></svg>
      <strong class="font-bold">Advertencia!</strong>
      <span class="block sm:inline">Está a punto de eliminar una función de que podría estar ligado un rol que a su vez a un usuario</span>
    </div>
  </div>
  {{endif isDEL}}
  <form class="w-full max-w-sm" action="index.php?page=mnt_rol&mode={{mode}}&rolescod={{rolescod}}"
    method="POST" >
    <section class="md:flex md:items-center mb-6">
    <label class="block text-gray-500 font-bold md:text-right mb-1 md:mb-0 pr-4" for="rolescod">Código del Rol</label>
    <input class="bg-gray-200 appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-purple-500" type="text" {{readonly}} {{ifnot isINS}}readonly{{endifnot isINS}} id="rolescod" name="rolescod" value="{{rolescod}}"/>
    <input type="hidden" id="mode" name="mode" value="{{mode}}"/>
    </section>
    <section class="md:flex md:items-center mb-6">
      <label class="block text-gray-500 font-bold md:text-right mb-1 md:mb-0 pr-4" for="rolesdsc">Descripción del Rol</label>
      <input class="bg-white appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-purple-500" type="text" {{readonly}} name="rolesdsc" value="{{rolesdsc}}" maxlength="45" placeholder="Descripcion del rol"/>
    </section>
    <section class="md:flex md:items-center mb-6">
      <label class="block text-gray-500 font-bold md:text-right mb-1 md:mb-0 pr-4" for="rolesest">Estado del Rol</label>
      {{if readonly}}
      <input type="hidden" id="rolesestdummy" name="rolesest" value=""/>
      {{endif readonly}}
      <select class="mt-1 block w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500" id="rolesest" name="rolesest" {{if readonly}}disabled{{endif readonly}}>
        <option value="ACT" {{rolesest_ACT}}>Activo</option>
        <option value="INA" {{rolesest_INA}}>Inactivo</option>
      </select>
    </section>

    {{if readonly}}
    <section class="border my-2">
      <p class="fw-bolder">Funciones del Rol</p>
      <ul>
        {{foreach rolesfunction}}
        <li> {{fncod}}</li>
        {{endfor rolesfunction}}
      </ul>
    </section>
  {{endif readonly}}

  {{ifnot readonly}}
  {{ifnot isINS}}
  
    <section>
        <table class="min-w-full divide-y divide-gray-200 ">
          <thead class="bg-gray-50">
            <tr>
              <th colspan="3" class = "text-gray-400">Funciones de Rol</th>
            </tr>
            <tr class="table-light">
              <th class=" px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Listado de Funciones</th>
              <th class=" px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Mover</th>
              <th class=" px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider" >Funciones Asignados</th>
            </tr>
          </thead>
          <tbody class="bg-white divide-y divide-gray-200">
            <tr>
              <td>
                <select class="form-select" multiple aria-label="Listado de Funciones" name="listfun" id="listfun">
                  {{foreach avafun}}
                  <option value="{{fncod}}">{{fncod}}</option>
                  {{endfor avafun}}
                </select>
              </td>
              <td class="flex flex-col justify-center">
                <button type="button" id="move_right" class="h-8 px-5 m-2 text-base text-white transition-colors duration-150 bg-green-700 rounded-lg focus:shadow-outline hover:bg-green-800">>></button>
                <br>
                <button type="button" id="move_left" class="h-8 px-5 m-2 text-base text-white transition-colors duration-150 bg-yellow-300 rounded-lg focus:shadow-outline hover:bg-yellow-500"><<</button>
              </td>
              <td>
                <input type="hidden" id="FunctionAssignRoles" name="FunctionAssignRoles" value="">
                <select class="form-select" multiple aria-label="Listado de Funciones" name="funroles" id="funroles">
                  {{foreach rolesfunction}}
                  <option value="{{fncod}}">{{fncod}}</option>
                  {{endfor rolesfunction}}
                </select>
              </td>
            </tr>
          </tbody>
        </table>
    </section>
    {{endifnot isINS}}
    {{endifnot readonly}}
    

    {{if hasErrors}}
        <section>
          <ul>
            {{foreach aErrors}}
                <li>{{this}}</li>
            {{endfor aErrors}}
          </ul>
        </section>
    {{endif hasErrors}}
    <section>
      {{if showaction}}
      <button class="h-10 px-5 m-2 text-blue-100 transition-colors duration-150 bg-blue-600 rounded-lg focus:shadow-outline hover:bg-blue-700" type="submit" name="btnGuardar" value="G">Guardar</button>
      {{endif showaction}}
      <button class="h-10 px-5 m-2 text-red-100 transition-colors duration-150 bg-red-700 rounded-lg focus:shadow-outline hover:bg-red-800" type="button" id="btnCancelar">Cancelar</button>
    </section>
  </form>
</section>


<script>
  document.addEventListener("DOMContentLoaded", function(){
    let rolesArr;
    let rolesInput;
    try {
      
      rolesArr = document.getElementById("funroles");
      rolesInput = document.getElementById("FunctionAssignRoles");
      rolesArr = Array.apply(null, rolesArr.options);
      rolesArr = rolesArr.map((opt) => opt.value);
      rolesInput.value = rolesArr.join(",");
    } catch (error) {
      
    }
    
      document.getElementById("btnCancelar").addEventListener("click", function(e){
        e.preventDefault();
        e.stopPropagation();
        window.location.assign("index.php?page=mnt_roles");
      });
      
      
      document.getElementById("move_right").addEventListener("click", function(e){
        e.preventDefault();
        listbox_moveacross("listfun","funroles");
      });
      document.getElementById("move_left").addEventListener("click", function(e){
        e.preventDefault();
        listbox_moveacross("funroles","listfun")
      });
      function listbox_moveacross(sourceID, destID) {
        var src = document.getElementById(sourceID);
        var dest = document.getElementById(destID);
        for(var count=0; count < src.options.length; count++) {
          if(src.options[count].selected == true) {
              var option = src.options[count];
              var newOption = document.createElement("option");
              newOption.value = option.value;
              newOption.text = option.text;
              newOption.selected = true;
              if(destID === 'funroles'){
                rolesArr.push(option.value);
              }else{
                let index = rolesArr.indexOf(option.value);
                rolesArr.splice(index,1);
              }
              rolesInput.value = rolesArr.join(",");
              try {
                  dest.add(newOption, null); /* Standard */
                  src.remove(count, null);
              }catch(error) {
                  dest.add(newOption);  /* IE only */
                  src.remove(count);
              }
              count--;
          }
        }
      }
      
  });
</script>
