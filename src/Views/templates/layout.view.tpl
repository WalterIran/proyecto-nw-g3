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
  <header class="sticky bg-white flex justify-center items-center px-2 px-16 shadow-md h-16">
    <div class="w-64">
      <img class="w-44 object-contain" src="https://farmaciasdelahorro.hn/logo-principal.png" alt="logo principal">
    </div>
    <div class="flex-auto">
      <div class="w-3/5 rounded-full mx-auto border border-green-200 flex items-center py-2 px-6">
        <input class="flex-auto h-full outline-none" type="text" placeholder="Busca tus medicamentos" name="search" id="search">
        <button type="button" class="transform hover:scale-110 duration-100 transition-all">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-green-200" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
          </svg>
        </button>
      </div>
    </div>
    <div class="w-64 flex justify-center space-x-2">
      <a href="" class="flex relative">
        <div href="" aria-label="shopping cart">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-9 w-9 text-gray-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z" />
          </svg>
        </div>
        <div class="absolute -top-1 font-bold -right-2 bg-red-600 text-white rounded-full w-5 h-5 flex justify-center items-center text-sm shadow">
          0
        </div>
      </a>
      <div class="flex h-10 space-x-1 text-gray-600">
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
  </header>
  <main class="relative p-4" style="min-height: calc(100vh - 120px);">
  {{{page_content}}}
  </main>
  <footer class="bg-green-500 flex justify-center items-center p-4 text-white">
    <div>Todo los Derechos Reservados 2021 &copy;</div>
  </footer>
  {{foreach EndScripts}}
    <script src="/{{~BASE_DIR}}/{{this}}"></script>
  {{endfor EndScripts}}
</body>
</html>
