<!-- <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet"> -->

<section class="grid justify-items-center gap-4 grid-cols-1 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5 m-auto w-full h-full" style="max-width: 1340px;">
    
    <!-- <div class="px-4 py-3 w-64 h-80 bg-gray-50 rounded-md shadow-md transition-all duration-100 hover:shadow-lg cursor-pointer">
        <div class="flex flex-col">
            <div class="flex flex-col items-center">
                <h2 class="text-sm font-bold">Mentolina Lata 12g, 1 de 12</h2>
                <p class="text-xs">Infarma</p>
            </div>
            <div class="flex justify-center items-center">
                <img class="w-32 h-32 object-contain" src="https://apis.ccc-it.net/api/v1/producto/16945/imagen" alt="">
            </div>
            <div class="text-xs text-gray-300 text-center">
                <p>Mentol, Esencia de Trementina, Alcanfor, Salicilato de metilo, Eucalipto</p>
            </div>
        </div>
        <div class="flex justify-center items-center py-2">
            <a href="" type="button" class="flex px-4 py-1 items-center justify-center space-x-1 border border-green-400 rounded-full transition-all duration-100 transform hover:scale-105">
                <span class="text-xs font-bold text-green-400">VER MÁS</span>
                <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 text-green-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="3" d="M9 5l7 7-7 7" />
                </svg>
            </a>
        </div>
        <div class="flex items-center justify-between py-2">
            <div>
                <button type="button" class="transition-all duration-200 transform hover:scale-105 hover:bg-gray-50 rounded-full p-2 flex justify-center items-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-gray-500" viewBox="0 0 20 20" fill="currentColor">
                        <path d="M15 8a3 3 0 10-2.977-2.63l-4.94 2.47a3 3 0 100 4.319l4.94 2.47a3 3 0 10.895-1.789l-4.94-2.47a3.027 3.027 0 000-.74l4.94-2.47C13.456 7.68 14.19 8 15 8z" />
                    </svg>
                </button>
            </div>
            <div class="flex-1 text-right">
                <p class="text-green-400 font-bold text-xl">L.22.53</p>
            </div>
        </div>
    </div> -->
    {{foreach products}}
    <div id="{{id}}" class="product bg-white px-4 py-3 w-64 h-80 rounded-md shadow-md transition-all duration-100 hover:shadow-lg cursor-pointer">
        <div class="flex flex-col">
            <div class="flex flex-col items-center">
                <h2 class="text-sm font-bold">{{name}}</h2>
                <p class="text-xs">{{provider}}</p>
            </div>
            <div class="flex justify-center items-center">
                <img class="w-32 h-32 object-contain" src="{{img}}" alt="">
            </div>
            <div class="text-xs text-gray-300 text-center">
                <p>{{description}}</p>
            </div>
        </div>
        <div class="flex justify-center items-center py-2">
            <form action="index.php" method="get">
                <input type="hidden" name="page" value="product_detail"/>
                <input type="hidden" name="id" value={{id}} />
                <button id="btnShow{{id}}" type="button" class="flex px-4 py-1 items-center justify-center space-x-1 border border-green-400 rounded-full transition-all duration-100 transform hover:scale-105">
                    <span class="text-xs font-bold text-green-400">VER MÁS</span>
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 text-green-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="3" d="M9 5l7 7-7 7" />
                    </svg>
                </button>
            </form>
        </div>
        <div class="flex items-center justify-between py-2">
            <div>
                <button type="button" class="transition-all duration-200 transform hover:scale-105 hover:bg-gray-50 rounded-full p-2 flex justify-center items-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-gray-500" viewBox="0 0 20 20" fill="currentColor">
                        <path d="M15 8a3 3 0 10-2.977-2.63l-4.94 2.47a3 3 0 100 4.319l4.94 2.47a3 3 0 10.895-1.789l-4.94-2.47a3.027 3.027 0 000-.74l4.94-2.47C13.456 7.68 14.19 8 15 8z" />
                    </svg>
                </button>
            </div>
            <div class="flex-1 text-right">
                <p class="text-green-400 font-bold text-xl">L.{{price}}</p>
            </div>
        </div>
    </div>
    {{endfor products}}
</section>
<script>
    document.addEventListener("DOMContentLoaded", () => {
        
        const products = document.getElementsByClassName("product");
        
        for (let product of products){
            product.addEventListener("click",() => {
                showProductDetail(product.id);
            });
        }

        function showProductDetail(id){
            const btnShow = document.getElementById("btnShow"+id);
            console.log(btnShow);
        }
    });
</script>