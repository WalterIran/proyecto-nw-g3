<section class="min-h-full flex items-center justify-center py-12 px-6 sm:px-6 lg:px-8 bg-white rounded-lg lg:mx-20">
  <form class=" max-w-md w-full space-y-8 mt-8 space-y-6" method="post" action="index.php?page=sec_login&redirto={{if redirto}}{{redirto}}{{endif redirto}}">
    <section class="depth-1 row col-12 col-m-8 offset-m-2 col-xl-6 offset-xl-3">
      <h1 class="mt-6 text-center text-3xl font-extrabold text-green-600">Inicio de Sesión</h1>
    </section>
    <section class="depth-1 py-5 row col-12 col-m-8 offset-m-2 col-xl-6 offset-xl-3">
      <div >
        <label class="sr-only" for="txtEmail">Correo Electrónico</label>
        <input class="appearance-none rounded-none block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm bg-gray-200 focus:bg-white" placeholder="Correo Electrónico" type="email" id="txtEmail" name="txtEmail" value="{{txtEmail}}" />
        {{if errorEmail}}
          <div class="error col-12 py-2 col-m-8 offset-m-4 text-red-600">{{errorEmail}}</div>
        {{endif errorEmail}}
      </div>
      <div >
        <label for="password" class="sr-only">Contraseña</label>
        <input class="appearance-none rounded-none block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-b-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm bg-gray-200 focus:bg-white" placeholder="Contraseña" type="password" id="txtPswd" name="txtPswd" value="{{txtPswd}}" />
        {{if errorPswd}}
        <div class="error col-12 py-2 col-m-8 offset-m-4 text-red-600">{{errorPswd}}</div>
        {{endif errorPswd}}
      </div>
    {{if generalError}}
      <div class="row text-red-600">
        {{generalError}}
      </div>
    {{endif generalError}}
    <div class="flex items-center justify-between">
        <div class="flex items-center">
          <a href="index.php?page=sec_register&mode=INS&user=" class="font-medium text-indigo-600 hover:text-indigo-500">
            ¡Crea tu Cuenta!
          </a>
        </div>

        <div class="text-sm">
          <a href="" class="font-medium text-indigo-600 hover:text-indigo-500">
            ¿Olvidaste tu Contraseña?
          </a>
        </div>
      </div>
      <div class="mt-8">
        <button id="btnLogin" type="submit" class="group w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-green-600 hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500">
          <span class="relative left-0 inset-y-0 flex items-center pl-3">
            <!-- Heroicon name: solid/lock-closed -->
            <svg class="h-5 w-5 green-500 group-hover:text-green-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
              <path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd" />
            </svg>
            
          </span>
          Inicio de Sesión
        </button>
      </div>
    </section>
  </form>
</section>
