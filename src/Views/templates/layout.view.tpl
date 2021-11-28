<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{{SITE_TITLE}}</title>
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
  <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
  {{foreach SiteLinks}}
    <link rel="stylesheet" href="/{{~BASE_DIR}}/{{this}}" />
  {{endfor SiteLinks}}
  {{foreach BeginScripts}}
    <script src="/{{~BASE_DIR}}/{{this}}"></script>
  {{endfor BeginScripts}}
</head>
<body>
  <header class="sticky bg-white flex justify-between flex-wrap lg:flex-nowrap lg:justify-center items-center py-2 lg:px-16 shadow-md lg:h-16">
    <div class="lg:w-64">
      <a href="index.php">
        <img class="w-32 lg:w-44 object-contain" src="https://farmaciasdelahorro.hn/logo-principal.png" alt="logo principal">
      </a>
    </div>
    <div class="flex-auto hidden lg:block">
      <form action="index.php" method="get">
        <div class="w-3/5 rounded-full mx-auto border border-gray-200 flex items-center py-2 px-6">
          <input type="hidden" name="page" value="products"/>
          <input name="search" id="searchDesktop" class="flex-auto h-full outline-none" type="text" placeholder="Busca tus medicamentos" >
          <button type="submit" id="btnSearchDesktop" class="transform hover:scale-110 duration-100 transition-all">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-green-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="3" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
            </svg>
          </button>
        </div>
      </form>
    </div>
    <div class="px-4 lg:px-0 lg:w-64 flex justify-center space-x-4 lg:space-x-2">
      <a href="" class="flex relative">
        <div href="" aria-label="shopping cart">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 lg:h-9 lg:w-9 text-gray-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z" />
          </svg>
        </div>
        <div class="absolute -top-1 font-bold -right-2 bg-red-600 text-white rounded-full w-5 h-5 flex justify-center items-center text-sm shadow">
          0
        </div>
      </a>
      <button type="button" id="open-menu" class="lg:hidden">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 text-green-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16m-7 6h7" />
        </svg>
      </button>
      <div class="hidden lg:flex h-10 space-x-1 text-gray-600">
        <div class="w-24 text-right align-middle font-medium leading-4 text-lg">
          Iniciar Sesión
        </div>
        <div class="flex">
          <div class="h-9 w-9">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-full w-full" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5.121 17.804A13.937 13.937 0 0112 16c2.5 0 4.847.655 6.879 1.804M15 10a3 3 0 11-6 0 3 3 0 016 0zm6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
          </div>
          <div class="h-9 py-1">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-full" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 5v.01M12 12v.01M12 19v.01M12 6a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2z" />
            </svg>
          </div>
        </div>
      </div>
    </div>
    <div class="w-full lg:hidden px-4 mt-2">
      <form action="index.php" method="get">
        <div class="w-full rounded-full mx-auto border border-gray-200 flex items-center py-2 px-6">
          <input type="hidden" name="page" value="products"/>
          <input name="search" id="searchMovil" class="flex-auto h-full outline-none" type="text" placeholder="Busca tus medicamentos">
          <button id="btnSearchMovil" type="submit" class="transform hover:scale-110 duration-100 transition-all">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-green-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
            </svg>
          </button>
        </div>
      </form>
    </div>
    <nav id="movil-menu" class="fixed inset-0 lg:hidden z-50 transition-all duration-300 transform -translate-x-full">
      <div class="bg-black opacity-50 fixed inset-0"></div>
      <div class="fixed inset-0 flex items-start">
        <div class="w-4/5 h-full bg-white">
          <ul class="w-full text-green-600">
            <li class="bg-green-500 py-4 flex flex-col justify-center items-center space-y-2">
              <img class="w-12 object-contain" src="https://farmaciasdelahorro.hn/logo_header.png" alt="movil welcome">
              <span class="text-white">
                Bienvenido Walter
              </span>
            </li>
            <li class="">
              <a href="index.php?page=sec_login" class="flex space-x-4 items-center px-4 py-2">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5.121 17.804A13.937 13.937 0 0112 16c2.5 0 4.847.655 6.879 1.804M15 10a3 3 0 11-6 0 3 3 0 016 0zm6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
                <span class="">
                  Iniciar Sesión
                </span>
              </a>
            </li>
            <li class="">
              <a href="index.php?page=sec_register&mode=INS" class="flex space-x-4 items-center px-4 py-2">

                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z" />
                </svg>
                <span class="">
                  Registrarse
                </span>
              </a>
            </li>
            <li class="">
              <a href="" class="flex space-x-4 items-center px-4 py-2">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
                </svg>
                <span class="">
                  Mis Pedidos
                </span>
              </a>
            </li>
            <li class="">
              <a href="" class="flex space-x-4 items-center px-4 py-2">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1" />
                </svg>
                <span class="">
                  Salir
                </span>
              </a>
            </li>
            <hr>
            <li class="">
              <a href="" class="flex space-x-4 items-center px-4 py-2">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6" />
                </svg>
                <span class="">
                  Inicio
                </span>
              </a>
            </li>
            <li class="">
              <a href="" class="flex space-x-4 items-center px-4 py-2">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6V4m0 2a2 2 0 100 4m0-4a2 2 0 110 4m-6 8a2 2 0 100-4m0 4a2 2 0 110-4m0 4v2m0-6V4m6 6v10m6-2a2 2 0 100-4m0 4a2 2 0 110-4m0 4v2m0-6V4" />
                </svg>
                <span class="">
                  Directorio
                </span>
              </a>
            </li>

          </ul>
        </div>
        <button id="close-menu" type="button" class="flex-1 flex justify-end p-4" aria-label="btn close">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
          </svg>
        </button>
      </div>
    </nav>
  </header>
  <main class="p-4 bg-green-50" style="min-height: calc(100vh - 120px);">
  {{{page_content}}}
  </main>
  <footer class="bg-green-500 flex justify-center items-center p-4 text-white">
    <div>Todo los Derechos Reservados 2021 &copy;</div>
  </footer>
  <script>
    document.addEventListener("DOMContentLoaded", () => {
      const btnOpenMenu = document.getElementById('open-menu');
      const movilMenu = document.getElementById('movil-menu');
      const btnCloseMenu = document.getElementById('close-menu');

      btnOpenMenu.addEventListener("click", (e) => {
        e.preventDefault();

        movilMenu.classList.add("translate-x-0");
        movilMenu.classList.remove("-translate-x-full");
      });

      btnCloseMenu.addEventListener("click", (e) => {
        e.preventDefault();

        movilMenu.classList.remove("translate-x-0");
        movilMenu.classList.add("-translate-x-full");
      });

      document.getElementById("searchDesktop").addEventListener("keypress", function (e) {
        if(e.key === 'Enter'){
          document.getElementById("btnSearchDesktop").click();
        }
      });
      document.getElementById("searchMovil").addEventListener("keypress", function (e) {
        if(e.key === 'Enter'){
          document.getElementById("btnSearchMovil").click();
        }
      });

    });
  </script>
  {{foreach EndScripts}}
    <script src="/{{~BASE_DIR}}/{{this}}"></script>
  {{endfor EndScripts}}
</body>
</html>
