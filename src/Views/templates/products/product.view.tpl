<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">

<!-- component -->
<style>@import url(https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.min.css);</style>

<div class="w-full max-w-6xl rounded bg-white shadow-xl p-10 mx-auto text-gray-800 relative">
    <div class="md:flex items-center -mx-10">
        <div class="w-full md:w-1/2 px-10 mb-10 md:mb-0">
            <div class="relative">
                <div class="border-4 border-green-200 w-full h-full flex justify-center items-center">
                    <img src="{{img}}" class="w-auto relative" alt="">
                </div>
            </div>
        </div>
        <!--Aqui va lo que viene de la bd-->
        <div class="w-full md:w-1/2 px-10">
        <form action="index.php?page=product&mode={{mode}}&id={{id}}" method="POST">
                <div class="mb-10">
                    <h1 class="font-bold uppercase text-2xl mb-5">{{name}}</h1>
                    <p class="text-sm">{{provider}} <br> {{description}}</p>
                </div>
                <div>
                    <div class="inline-block align-bottom mr-5">
                        <span class="text-2xl leading-none align-baseline">L. </span>
                        <span class="font-bold text-5xl leading-none align-baseline">{{price}}</span>
                    </div>
                    {{if showaction}}
                        <button type="submit" class="bg-green-300 opacity-75 hover:opacity-100 text-green-900 hover:text-gray-900 rounded-full px-10 py-2 font-semibold" id="btnAdd" value="G"><i class="mdi mdi-cart -ml-2 mr-2"></i>Agregar al Carrito</button>
                    {{endif showaction}}
                    </div>
                </div>
        </form>
        </div>
    </div>
</div>
<script>
   document.addEventListener("DOMContentLoaded", function () {
      document.getElementById("btnAdd").addEventListener("click", function (e) {
        e.preventDefault();
        e.stopPropagation();
        window.location.assign("index.php?page=product&mode=INS");
      });
    });
</script>

