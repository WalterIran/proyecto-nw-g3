  <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
<h1 class ="text-lg font-bold" >{{mode_dsc}}</h1>
<section>
  <form action="index.php?page=mnt_cliente&mode={{mode}}&clientid={{usercod}}" method="POST" >
    <div class="shadow overflow-hidden sm:rounded-md">
        <div class="grid gap-3 grid-cols-5">

            <section class="col-span-1 ">
                <label class = "label-text" for="usercod">Código</label>
                <input class="text-input" type="hidden" id="usercod" name="usercod" value="{{usercod}}"/>
                <input class="text-input" type="hidden" id="mode" name="mode" value="{{mode}}" />
                <input class="text-input" type="hidden" id="xsrftoken" name="xsrftoken" value="{{xsrftoken}}" />
                <input class="text-input" type="text" readonly name="usercoddummy" value="{{usercod}}"/>
            </section>

            <section class="col-span-3 ">
                <label class = "label-text" for="username">Nombre Completo</label>
                <input class="text-input" type="text" {{readonly}} name="username" value="{{username}}" maxlength="45" placeholder="Nombre de Cliente"/>
                  {{if errorName}}
                    <div class="text-red-500 error col-12 py-2 col-m-8 offset-m-4">{{errorName}}</div>
                  {{endif errorName}}
            
            </section>

            
            <section class="col-span-1 ">
              <label class = "label-text" for="usergender">Género</label>
              {{if readonly}}
              <input type="hidden" id="usergenderdummy" name="usergender" value="" />
              {{endif readonly}}
              <select class="mt-1 block w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500" id="usergender" name="usergender" {{if readonly}}disabled{{endif readonly}}>
                <option value="M" {{usergen_MAS}}>Masculino</option>
                <option value="F" {{usergen_FEM}}>Femenino</option>
              </select>
            </section>

             <section class="col-span-1 ">
                <label class = "label-text" for="userphone">Teléfono Principal</label>
                <input class="text-input" type="text" {{readonly}} name="userphone" value="{{userphone}}" maxlength="45" placeholder="Número de Telefono"/>
                  {{if errorPhone}}
                    <div class="text-red-500 error col-12 py-2 col-m-8 offset-m-4">{{errorPhone}}</div>
                  {{endif errorPhone}}
            </section>

            <section class="col-span-1 ">
                <label class = "label-text" for="userphone2">Teléfono Secundario</label>
                <input class="text-input" type="text" {{readonly}} name="userphone2" value="{{userphone2}}" maxlength="45" placeholder="Número de Telefono"/>
            </section>

            <section class="col-span-2 ">
             <label class = "label-text" for="useraddress">Direccion</label>
                <textarea class="text-input" {{readonly}} rows="1" name="useraddress" placeholder="Biografía"/> {{useraddress}}</textarea>
                  {{if errorAddress}}
                    <div class="text-red-500 error col-12 py-2 col-m-8 offset-m-4">{{errorAddress}}</div>
                  {{endif errorAddress}}
            
            </section>

            <section class="col-span-1 ">
              <label class = "label-text" for="userrole">Rol</label>
              {{if readonly}}
              <input type="hidden" id="userroledummy" name="userrole" value="" />
              {{endif readonly}}
              <select class="mt-1 block w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500" id="userrole" name="userrole" {{if readonly}}disabled{{endif readonly}}>
                <option value="PBL" {{userrol_PBL}}>Publico</option>
                <option value="ADMIN" {{userrol_ADMIN}}>Administrador</option>
                <option value="AUD" {{userrol_AUD}}>Auditor</option>
              </select>
            </section>

            <section class="col-span-1 ">
              <label class = "label-text" for="userest">Status</label>
              {{if readonly}}
              <input type="hidden" id="userestdummy" name="userest" value="" />
              {{endif readonly}}
              <select class="mt-1 block w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500" id="userest" name="userest" {{if readonly}}disabled{{endif readonly}}>
                <option value="ACT" {{userest_ACT}}>Activo</option>
                <option value="INA" {{userest_INA}}>Inactivo</option>
                <option value="BLQ" {{userest_BLQ}}>Bloqueado</option>
                <option value="SUS" {{userest_SUS}}>Suspendido</option>
              </select>
            </section>

            <section class="col-span-2 ">
             <label class = "label-text" for="useremail">Correo Electrónico</label>
                <input class="text-input" type="text" {{readonly}} name="useremail" value="{{useremail}}" maxlength="45" placeholder="Correo Cliente"/>
                  {{if errorEmail}}
                    <div class="text-red-500 error col-12 py-2 col-m-8 offset-m-4">{{errorEmail}}</div>
                  {{endif errorEmail}}
            </section>
            {{if showaction}}
              <section class="col-span-1">
                <label class = "label-text" for='userpswd'>Contraseña</label>
                <input class="text-input" type="password" {{readonly}} name="userpswd" value="" maxlength="45" placeholder='Contraseña'/>
                {{if errorPswd}}
                  <div class="text-red-500 error col-12 py-2 col-m-8 offset-m-4">{{errorPswd}}</div>
                {{endif errorPswd}}
              </section>

              <section class="col-span-1">
                <label class = "label-text" for="userpswdrpt">Confirmar Contraseña</label>
                <input class="text-input" type="password" {{readonly}} name="userpswdrpt" value="" placeholder='Repetir Contraseña'/>
                {{if errorPass}}
                  <div class="text-red-500 error col-12 py-2 col-m-8 offset-m-4">{{errorPass}}</div>
                {{endif errorPass}}
              </section>
            {{endif showaction}}
            <section class="col-span-3 ">
             <label class = "label-text" for="userbio">Perfil</label>
                <textarea class="text-input"  {{readonly}} rows="10" name="userbio" placeholder="Biografía"/> {{userbio}}</textarea>
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
