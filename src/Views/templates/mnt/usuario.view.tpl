<style>
    input[type=number]::-webkit-inner-spin-button, 
    input[type=number]::-webkit-outer-spin-button { 
      -webkit-appearance: none; 
      margin: 0; 
    }
  </style>
<section class="min-h-full flex items-center justify-center py-12 px-6 sm:px-6 lg:px-8 bg-white rounded-lg mx-20">
  <form class=" max-w-md w-full space-y-8 mt-8 space-y-6" action="index.php?page=mnt_usuario&mode={{mode}}&user={{user}}"
    method="POST" >
    <section class="depth-1 row col-12 col-m-8 offset-m-2 col-xl-6 offset-xl-3">
      <h1 class="mt-6 text-center text-3xl font-extrabold text-green-600">{{mode_dsc}}</h1>
    </section>
    {{ifnot readonlyuser}}
    <section class="depth-1 py-5 row col-12 col-m-8 offset-m-2 col-xl-6 offset-xl-3">
        <label class="sr-only" for='user'>Usuario</label>
        <input class="appearance-none rounded-none block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm bg-gray-200 focus:bg-white" placeholder="Usuario" type="text" {{readonlyuser}} id='user' name='user' value="{{user}}"/>
        <input class="hidden md:block" type="hidden" id="mode" name="mode" value="{{mode}}">
    </section>
    {{endifnot readonlyuser}}
    <section>
        <label class="sr-only" for='useremail'>Correo</label>
        <input class="appearance-none rounded-none block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm bg-gray-200 focus:bg-white" placeholder="Correo Electrónico" type="email" {{readonly}} name='useremail' value="{{useremail}}" maxlength="45" placeholder='Correo electrónico'/>
    </section>
    <section>
        <label class="sr-only" for='username'>Nombre de usuario</label>
        <input class="appearance-none rounded-none block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm bg-gray-200 focus:bg-white" placeholder="Nombre" type="text" {{readonly}} name='username' value="{{username}}" maxlength="45" placeholder='Nombre de usuario'/>
    </section>
    {{ifnot readonly}}<!-- If not DSP mode then show -->
    {{ifnot chgpswd}} <!-- If INS mode hide change password checkbox | Always show password and repeat password -->
    <section class="form-check">
      <input class="form-check-input" type="checkbox" id="chgPswd" name="chgPswd">
      <label class="form-check-label" for="chgPswd">
        Cambiar contraseña
      </label>
    </section>
    {{endifnot chgpswd}}
    <div id="pswd_field" {{ifnot chgpswd}}class="d-none"{{endifnot chgpswd}}>
      <section>
        <label class="sr-only" for='userpswd'>Contraseña</label>
        <input class="appearance-none rounded-none block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm bg-gray-200 focus:bg-white" placeholder="Contraseña" type="password" {{readonly}} name='userpswd' value="" maxlength="45" placeholder='Contraseña'/>
      </section>
      <section>
        <label class="sr-only" for='userpswdrpt'>Confirmar Contraseña</label>
        <input class="mt-8 appearance-none rounded-none block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm bg-gray-200 focus:bg-white" placeholder="Confirmar Contraseña" type="password" {{readonly}} name='userpswdrpt' value="" placeholder='Repetir Contraseña'/>
      </section>
    </div>
    {{endifnot readonly}}
    <section>
        <label class="sr-only" for='userphone'>Número de Teléfono</label>
        <input class="appearance-none rounded-none block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm bg-gray-200 focus:bg-white" placeholder="Número de Teléfono" type="number" {{readonly}} name='userphone' value="{{userphone}}" maxlength="8" placeholder='Número de Teléfono'/>
    </section>
    <section>
        <label class="sr-only" for='useraddress'>Dirección</label>
        <textarea class="form-textarea mt-1 block w-full appearance-none rounded-none block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm bg-gray-200 focus:bg-white" placeholder="Dirección" type="textarea" rows="3" {{readonly}} name='useraddress' value="{{useraddress}}" maxlength="249" placeholder='Dirección'></textarea>
    </section>
    <section>
        <label for='username'>Género</label>
        <input type="radio" {{readonly}} class="form-radio" name="usergender" value="M">
        <span class="ml-2">Masculino</span>
        </label>
        <label class="inline-flex items-center ml-6">
          <input type="radio" {{readonly}} class="form-radio" name="usergender" value="F">
          <span class="ml-2">Femenino</span>
        </label>
    </section>
    <section>
        <label for='userest'>Estado del Usuario</label>
        {{if readonly}}
        <input type="hidden" {{readonly}} name='userestDummy' value="" />
        {{endif readonly}}
        <select name="userest" id="userest" {{if readonly}}disabled{{endif readonly}} >
          <option value="ACT" {{userest_ACT}}>Activo</option>
          <option value="INA" {{userest_INA}}>Inactivo</option>
          <option value="SUS" {{userest_SUS}}>Suspendido</option>
          <option value="BLQ" {{userest_BLQ}}>Bloqueado</option>
        </select>
    </section>
    <section>
        <label for='userrole'>Tipo de Usuario</label>
        {{if readonly}}
        <input type="hidden" {{readonly}} name='userroleDummy' value="" />
        {{endif readonly}}
        <select name="userrole" id="userrole" {{if readonly}}disabled{{endif readonly}} >
          <option value="PBL" {{userrole_PBL}}>Público</option>
          <option value="ADM" {{userrole_ADM}}>Administrador</option>
          <option value="AUD" {{userrole_AUD}}>Auditor</option>
        </select>
    </section >
    <section class="flex flex-row">
      {{if showaction}}
      <button class="mx-2 flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-green-600 hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500" type="submit" name="btnGuardar" value="G">Guardar</button>
      {{endif showaction}}
      <button class="mx-2 flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-red-600 hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500" type="button" id="btnCancelar">Cancelar</button>
    </section>
  </form>
</section>
</div>