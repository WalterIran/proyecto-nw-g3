<style>
    input[type=number]::-webkit-inner-spin-button, 
    input[type=number]::-webkit-outer-spin-button { 
      -webkit-appearance: none; 
      margin: 0; 
    }
  </style>
<section class="min-h-full flex items-center justify-center py-12 px-6 sm:px-6 lg:px-8 bg-white rounded-lg mx-20">
  <form class=" max-w-md w-full space-y-8 mt-8 space-y-6" action="index.php?page=sec_register&mode={{mode}}&user={{user}}"
    method="POST" >
    <section class="depth-1 row col-12 col-m-8 offset-m-2 col-xl-6 offset-xl-3">
      <h1 class="mt-6 text-center text-3xl font-extrabold text-green-600">{{mode_dsc}}</h1>
    </section>
    <section class="depth-1 row col-12 col-m-8 offset-m-2 col-xl-6 offset-xl-3">
        <label for='usercod'>Códido de Usuario</label>
        <input type="hidden" id='usercod' name='usercod' value="{{usercod}}"/>
        <input type="hidden" id="mode" name="mode" value="{{mode}}">
        <input class="appearance-none rounded-none block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm bg-gray-200 focus:bg-white" placeholder="Código de Usuario" type="text" readonly name='usercoddummy' value="{{usercod}}"/>
    </section>
    <section>
        <label class="sr-only" for='useremail'>Correo</label>
        <input class="appearance-none rounded-none block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm bg-gray-200 focus:bg-white" placeholder="Correo Electrónico" type="email" {{readonly}} name='useremail' value="{{useremail}}" maxlength="45" placeholder='Correo electrónico'/>
        {{if errorEmail}}
          <div class="text-red-500 error col-12 py-2 col-m-8 offset-m-4">{{errorEmail}}</div>
        {{endif errorEmail}}
    </section>
    <section>
        <label class="sr-only" for='username'>Nombre de usuario</label>
        <input class="appearance-none rounded-none block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm bg-gray-200 focus:bg-white" placeholder="Nombre" type="text" {{readonly}} name='username' value="{{username}}" maxlength="45" placeholder='Nombre de usuario'/>
        {{if errorName}}
          <div class="text-red-500 error col-12 py-2 col-m-8 offset-m-4">{{errorName}}</div>
        {{endif errorName}}
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
        {{if errorPswd}}
          <div class="text-red-500 error col-12 py-2 col-m-8 offset-m-4">{{errorPswd}}</div>
        {{endif errorPswd}}
      </section>
      <section>
        <label class="sr-only" for='userpswdrpt'>Confirmar Contraseña</label>
        <input class="mt-8 appearance-none rounded-none block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm bg-gray-200 focus:bg-white" placeholder="Confirmar Contraseña" type="password" {{readonly}} name='userpswdrpt' value="" placeholder='Repetir Contraseña'/>
        {{if errorPass}}
          <div class="text-red-500 error col-12 py-2 col-m-8 offset-m-4">{{errorPass}}</div>
        {{endif errorPass}}
      </section>
    </div>
    {{endifnot readonly}}
    <section>
        <label class="sr-only" for='userphone'>Número de Teléfono</label>
        <input class="appearance-none rounded-none block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm bg-gray-200 focus:bg-white" placeholder="Número de Teléfono" type="number" {{readonly}} name='userphone' value="{{userphone}}" maxlength="8"/>
        {{if errorPhone}}
          <div class="text-red-500 error col-12 py-2 col-m-8 offset-m-4">{{errorPhone}}</div>
        {{endif errorPhone}}
    </section>
    <section>
        <label class="sr-only" for='userphone2'>Número de Teléfono 2</label>
        <input class="appearance-none rounded-none block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm bg-gray-200 focus:bg-white" placeholder="Número de Teléfono 2" type="number" {{readonly}} name='userphone2' value="{{userphone2}}" maxlength="8"/>
    </section>
    <section>
        <label class="sr-only" for='useraddress'>Dirección</label>
        <textarea class="form-textarea mt-1 block w-full appearance-none rounded-none block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm bg-gray-200 focus:bg-white" style="resize: none;" placeholder="Dirección" type="textarea" rows="3" {{readonly}} name='useraddress' value="{{useraddress}}" maxlength="150" placeholder='Dirección'></textarea>
        {{if errorAddress}}
          <div class="text-red-500 error col-12 py-2 col-m-8 offset-m-4">{{errorAddress}}</div>
        {{endif errorAddress}}
    </section>
    <section>
        <label class="sr-only" for='userbio'>Bio</label>
        <textarea class="form-textarea mt-1 block w-full appearance-none rounded-none block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm bg-gray-200 focus:bg-white" style="resize: none;" placeholder="Bio" type="textarea" rows="3" {{readonly}} name='userbio' value="{{userbio}}" maxlength="150" placeholder='Bio'></textarea>
    </section>
    <section>
        <label for='usergender'>Género<br></label>
        <input type="radio" {{readonly}} class="form-radio" name="usergender" value="M" checked>
        <span class="ml-2">Masculino</span>
        </label>
        <label class="inline-flex items-center ml-6">
          <input type="radio" {{readonly}} class="form-radio" name="usergender" value="F">
          <span class="ml-2">Femenino</span>
        </label>
    </section>
    <section class="flex flex-row">
      {{if showaction}}
      <button class="mx-2 flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-green-600 hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500" type="submit" id="btnGuardar" name="btnGuardar" value="G">Guardar</button>
      {{endif showaction}}
      <button class="mx-2 flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-red-600 hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500" type="button" id="btnCancelar" name="btnCancelar" value="C">Cancelar</button>
    </section>
    {{if showactionins}}
    <div class="flex items-center justify-between">
        <div class="flex items-center">
          ¿Ya tienes cuenta?
          <a href="index.php?page=sec_login" class="font-medium text-indigo-600 hover:text-indigo-500">
             Inicia Sesión
          </a>
        </div>
      </div>
      {{endif showactionins}}
  </form>
</section>
</div>