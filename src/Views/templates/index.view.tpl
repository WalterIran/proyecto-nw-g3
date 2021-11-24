<!--Carrusel-->
<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet"/>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/> <!-- Swiper's CSS -->
<style>
.swiper-pagination-bullet-active {
    background: #059669;
}
</style>
<div class="swiper mySwiper">
    <div class="swiper-wrapper">
        <div class="swiper-slide flex justify-center items-center">
          <img class="object-cover w-100 h-auto" src="https://farmaciasdelahorro.hn/0.png" alt="apple watch photo"/>
        </div>
        <div class="swiper-slide flex justify-center items-center">
          <img class="object-cover w-100 h-auto" src="https://farmaciasdelahorro.hn/1.png" alt="apple watch photo"/>
        </div>
        <div class="swiper-slide flex justify-center items-center">
          <img class="object-cover w-100 h-auto" src="https://farmaciasdelahorro.hn/2.png" alt="apple watch photo"/>
        </div>
        <div class="swiper-slide flex justify-center items-center">
          <img class="object-cover w-100 h-auto" src="https://farmaciasdelahorro.hn/3.png" alt="apple watch photo"/>
        </div>
    </div>
    <div class="swiper-button-next" style="color: #059669;"></div>
    <div class="swiper-button-prev" style="color: #059669"></div>
    <div class="swiper-pagination"></div>
</div>
<!--Fin-->

<!--Mision, Vision, Valores-->
<hr class="bg-green-500 h-1 mt-14">
<div class="container my-12 mx-auto px-4 md:px-12">
    <div class="flex flex-wrap -mx-1 lg:-mx-4">
        <!-- Mision -->
        <div class="my-1 px-1 w-full md:w-1/2 lg:my-4 lg:px-4 lg:w-1/3">
            <article class="overflow-hidden rounded-lg shadow-lg bg-white">
                <div class="flex justify-center items-center">
                    <img alt="Mision" class="block h-auto w-72" src="public/imgs/fa_imgs/mision.png">
                </div>
                    
            <header class="flex items-center justify-between leading-tight p-2 md:p-4">
                <h1 class="text-2xl">Misión</h1>
            </header>
            
            <p class="text-grey-darker text-base m-5 -mt-3 text-justify">
                Ofrecer una asistencia sanitaria de calidad, para alcanzar y mantener la salud, ofreciendo servicios farmacéuticos y productos, de forma profesional, servicial y cercana.
            </p>   
            </article>
        </div>
        <!-- Fin Mision -->

        <!-- Vision -->
        <div class="my-1 px-1 w-full md:w-1/2 lg:my-4 lg:px-4 lg:w-1/3">
            <article class="overflow-hidden rounded-lg shadow-lg bg-white">
                <div class="flex justify-center items-center">
                    <img alt="Vision" class="block h-auto w-72" src="public/imgs/fa_imgs/vision.png">
                </div>
                    
            <header class="flex items-center justify-between leading-tight p-2 md:p-4">
                <h1 class="text-2xl">Visión</h1>
            </header>
            
            <p class="text-grey-darker text-base m-5 -mt-3 text-justify">
                Facilitar un rápido acceso a los productos que precisen, primando los servicios profesionales, para que saquen el máximo beneficio a sus medicamentos.
            </p>   
            </article>
        </div>
        <!-- Fin Vision -->

        <!-- Valores -->
        <div class="my-1 px-1 w-full md:w-1/2 lg:my-4 lg:px-4 lg:w-1/3">
            <article class="overflow-hidden rounded-lg shadow-lg bg-white">
                <div class="flex justify-center items-center">
                    <img alt="Valores" class="block h-auto w-72" src="public/imgs/fa_imgs/valores.png">
                </div>
                    
            <header class="flex items-center justify-between leading-tight p-2 md:p-4">
                <h1 class="text-2xl">Valores</h1>
            </header>
            
            <p class="text-grey-darker text-base m-5 -mt-3 text-justify">
                Compromiso, Conocimiento, Cooperación, Humanidad, Innovación, Integridad, Liderazgo, Profesionalidad, Transparencia
            </p>   
            </article>
        </div>
        <!-- Fin Valores -->
    </div>
</div>
<!--Fin-->

<!--Contacto-->
<hr class="bg-green-500 h-1">
<div class="container my-12 mx-auto px-4 md:px-12 bg-white rounded-lg shadow-lg">
    <h1 class="text-2xl flex justify-center items-center text-green-900 pt-5">Contacto</h1>
    <div class="flex flex-wrap -mx-1 lg:-mx-4">
        <div class="my-1 px-1 w-full md:w-1/2 lg:my-4 lg:px-4 lg:w-1/2">
        <div class="flex justify-center items-center">
            <ul>
                <li class="text-green-600">¿Necesitas Ayuda?</li>
                <li class="text-green-900">+504 2276-4747</li>
                <br>
                <li class="text-green-600">Horario de atención en tienda</li>
                <li class="text-green-900">8:00 am - 10:00 pm</li>
                <br>
            </ul> 
        </div>    
        </div>
        <div class="my-1 px-1 w-full md:w-1/2 lg:my-4 lg:px-4 lg:w-1/2">
        <div class="flex justify-center items-center">
            <ul>
                <li class="text-green-600">Correo Electrónico</li>
                <li class="text-green-900">Información General: info@info.hn</li>
                <br>
                <li class="text-green-600">WhatApp Contact Center</li>
                <li class="text-green-900">Lun a Sab: 8:00 am - 8:00 pm</li>
            </ul>
        </div>     
        </div>
    </div>
</div>
<!--Fin Contacto-->

<!-- Swiper JS -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script>
    let swiper = new Swiper('.mySwiper', {
        spaceBetween: 10,
        centeredSlides: true,
        effect: "fade",
        autoplay: {
          delay: 3000,
          disableOnInteraction: false,
        },
        pagination: {
          el: '.swiper-pagination',
          
          clickable: true,
        },
        navigation: {
          nextEl: '.swiper-button-next',
          prevEl: '.swiper-button-prev',
        },
      });
</script>

