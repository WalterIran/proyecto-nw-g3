  <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
<h1 class ="text-lg font-bold" >{{mode_dsc}}</h1>
<section>
  <form action="index.php?page=mnt_cliente&mode={{mode}}&clientid={{clientid}}" method="POST" >
    <div class="shadow overflow-hidden sm:rounded-md">
        <div class="grid grid-cols-6 gap-3">

            <section class="col-span-2 ">
                <label class = "label-text" for="clientid">Código</label>
                <input class="text-input" type="hidden" id="clientid" name="clientid" value="{{clientid}}"/>
                <input class="text-input" type="hidden" id="mode" name="mode" value="{{mode}}" />
                <input class="text-input" type="hidden" id="xsrftoken" name="xsrftoken" value="{{xsrftoken}}" />
                <input class="text-input" type="text" readonly name="clientidddummy" value="{{clientid}}"/>
            </section>

            <section class="col-span-2 ">
                <label class = "label-text" for="clientIdnumber">Número Cliente</label>
                <input class="text-input" type="text" {{readonly}} name="clientIdnumber" value="{{clientIdnumber}}" maxlength="45" placeholder="Numero Cliente"/>
            </section>

            <section class="col-span-2 ">
                <label class = "label-text" for="clientdatecrt">Fecha Inscripción</label>
                <input class="text-input" type="date" {{readonly}} name="clientdatecrt" value="{{clientdatecrt}}" maxlength="45" placeholder="Fecha"/>
            </section>
            
            <section class="col-span-4 ">
                <label class = "label-text" for="clientname">Nombre Completo</label>
                <input class="text-input" type="text" {{readonly}} name="clientname" value="{{clientname}}" maxlength="45" placeholder="Nombre de Cliente"/>
            </section>

            <section class="col-span-1 ">
              <label class = "label-text" for="clientstatus">Status</label>
              {{if readonly}}
              <input type="hidden" id="clientstatusdummy" name="clientstatus" value="" />
              {{endif readonly}}
              <select class="mt-1 block w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500" id="clientstatus" name="clientstatus" {{if readonly}}disabled{{endif readonly}}>
                <option value="ACT" {{cliest_ACT}}>Activo</option>
                <option value="INA" {{cliest_INA}}>Inactivo</option>
              </select>
            </section>

            <section class="col-span-1 ">
              <label class = "label-text" for="clientgender">Género</label>
              {{if readonly}}
              <input type="hidden" id="clientgenderdummy" name="clientgender" value="" />
              {{endif readonly}}
              <select class="mt-1 block w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500" id="clientgender" name="clientgender" {{if readonly}}disabled{{endif readonly}}>
                <option value="MAS" {{cligen_MAS}}>Masculino</option>
                <option value="FEM" {{cligen_FEM}}>Femenino</option>
              </select>
            </section>

            <section class="col-span-1 ">
                <label class = "label-text" for="clientphone1">Teléfono Principal</label>
                <input class="text-input" type="text" {{readonly}} name="clientphone1" value="{{clientphone1}}" maxlength="45" placeholder="Número de Telefono"/>
            </section>

            <section class="col-span-1 ">
                <label class = "label-text" for="clientphone2">Teléfono Secundario</label>
                <input class="text-input" type="text" {{readonly}} name="clientphone2" value="{{clientphone2}}" maxlength="45" placeholder="Número de Telefono"/>
            </section>

            <section class="col-span-4 ">
             <label class = "label-text" for="clientemail">Correo Electrónico</label>
                <input class="text-input" type="text" {{readonly}} name="clientemail" value="{{clientemail}}" maxlength="45" placeholder="Correo Cliente"/>
            </section>

            <section class="col-span-4 ">
             <label class = "label-text" for="clientbio">Perfil</label>
                <textarea class="text-input"  rows="10" name="clientbio" placeholder="Biografía"/> {{clientbio}}</textarea>
            </section>
            
        
            {{if hasErrors}}
                <section>
                <ul>
                    {{foreach Errors}}
                        <li>{{this}}</li>
                    {{endfor Errors}}
                </ul>
                </section>
            {{endif hasErrors}}
            <section class="col-span-2 flex flex-col justify-items-center place-content-center ">
            {{if showaction}}
            <button class = "bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 m-2.5 rounded" type="submit" name="btnGuardar" value="G">Guardar</button>
            {{endif showaction}}
            <button class = "bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 m-2.5 rounded" type="button" id="btnCancelar">Cancelar</button>
            </section>
        </div>
    </div>
  </form>
</section>


<script>
  document.addEventListener("DOMContentLoaded", function(){

   

      document.getElementById("btnCancelar").addEventListener("click", function(e){
        e.preventDefault();
        e.stopPropagation();
        window.location.assign("index.php?page=mnt_clientes");
      });

    
  });
</script>
