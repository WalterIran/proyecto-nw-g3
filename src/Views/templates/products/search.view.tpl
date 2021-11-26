<!-- <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet"> -->
<section class="py-4 px-2 text-center lg:text-left w-full flex flex-col lg:flex-row">
    <p class="flex-none truncate">Resultados encontrados para &nbsp;</p>
    <span class="font-semibold max-w-full flex-1 flex overflow-hidden">"<span class="truncate">{{search}}</span>"</span>
</section>
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
                <h2 class="text-sm font-bold truncate">{{name}}</h2>
                <p class="text-xs truncate">{{provider}}</p>
            </div>
            <div class="flex justify-center items-center">
                <img class="w-32 h-32 object-contain" src="{{img}}" alt="">
            </div>
            <div class="text-xs text-gray-300 text-center truncate">
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
                <button type="button" value="{{id}}"
                class="btnShare relative transition-all duration-200 transform hover:scale-105 hover:bg-gray-50 rounded-full p-2 flex justify-center items-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-gray-500" viewBox="0 0 20 20" fill="currentColor">
                        <path d="M15 8a3 3 0 10-2.977-2.63l-4.94 2.47a3 3 0 100 4.319l4.94 2.47a3 3 0 10.895-1.789l-4.94-2.47a3.027 3.027 0 000-.74l4.94-2.47C13.456 7.68 14.19 8 15 8z" />
                    </svg>
                    <div id="shareOpt{{id}}" class="absolute bottom-full inset-x-0 flex space-y-2 items-center flex-col text-white transition-all duration-150 hidden">
                        <a target="_blank" href="https://web.whatsapp.com/send?text=https://linkdelapp.com/products :: {{name}}" class="rounded-full w-8 h-8 flex justify-center items-center p-1 bg-green-500">
                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" role="img" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 24 24"><g fill="none"><path fill-rule="evenodd" clip-rule="evenodd" d="M17.415 14.382c-.298-.149-1.759-.867-2.031-.967c-.272-.099-.47-.148-.669.15c-.198.296-.767.966-.94 1.164c-.174.199-.347.223-.644.075c-.297-.15-1.255-.463-2.39-1.475c-.883-.788-1.48-1.761-1.653-2.059c-.173-.297-.019-.458.13-.606c.134-.133.297-.347.446-.52c.149-.174.198-.298.297-.497c.1-.198.05-.371-.025-.52c-.074-.149-.668-1.612-.916-2.207c-.241-.579-.486-.5-.668-.51c-.174-.008-.372-.01-.57-.01c-.198 0-.52.074-.792.372c-.273.297-1.04 1.016-1.04 2.479c0 1.462 1.064 2.875 1.213 3.074c.149.198 2.095 3.2 5.076 4.487c.71.306 1.263.489 1.694.625c.712.227 1.36.195 1.872.118c.57-.085 1.758-.719 2.006-1.413c.247-.694.247-1.289.173-1.413c-.074-.124-.272-.198-.57-.347zm-5.422 7.403h-.004a9.87 9.87 0 0 1-5.032-1.378l-.36-.214l-3.742.982l.999-3.648l-.235-.374a9.861 9.861 0 0 1-1.511-5.26c.002-5.45 4.436-9.884 9.889-9.884c2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 0 1 2.892 6.993c-.002 5.45-4.436 9.885-9.884 9.885zm8.412-18.297A11.815 11.815 0 0 0 11.992 0C5.438 0 .102 5.335.1 11.892c-.001 2.096.546 4.142 1.587 5.945L0 24l6.304-1.654a11.881 11.881 0 0 0 5.684 1.448h.005c6.554 0 11.89-5.335 11.892-11.893a11.821 11.821 0 0 0-3.48-8.413" fill="currentColor"/></g></svg>
                        </a>
                        <a target="_blank" href="http://www.facebook.com/share.php?u=https://linkdelapp.com/products&quote={{name}}" class="rounded-full w-8 h-8 flex justify-center items-center p-1 bg-blue-700">
                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" role="img" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 32 32"><path d="M23.446 18l.889-5.791h-5.557V8.451c0-1.584.776-3.129 3.265-3.129h2.526V.392S22.277.001 20.085.001c-4.576 0-7.567 2.774-7.567 7.795v4.414H7.431v5.791h5.087v14h6.26v-14z" fill="currentColor"/></svg>
                        </a>
                        <a target="_blank" href="https://telegram.me/share/?url=https://linkdelapp.com/products&text={{name}}" class="rounded-full w-8 h-8 flex justify-center items-center p-1 bg-blue-300">
                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" role="img" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 24 24"><g stroke-width="1.5" fill="none"><path d="M21 5L2 12.5l7 1M21 5l-2.5 15L9 13.5M21 5L9 13.5m0 0V19l3.249-3.277" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"/></g></svg>
                        </a>
                        <a target="_blank" href="https://twitter.com/share?url=https://linkdelapp.com/products&text={{name}}" class="rounded-full w-8 h-8 flex justify-center items-center p-1 bg-blue-400">
                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" aria-hidden="true" role="img" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 24 24"><g fill="none"><path d="M23.643 4.937c-.835.37-1.732.62-2.675.733a4.67 4.67 0 0 0 2.048-2.578a9.3 9.3 0 0 1-2.958 1.13a4.66 4.66 0 0 0-7.938 4.25a13.229 13.229 0 0 1-9.602-4.868c-.4.69-.63 1.49-.63 2.342A4.66 4.66 0 0 0 3.96 9.824a4.647 4.647 0 0 1-2.11-.583v.06a4.66 4.66 0 0 0 3.737 4.568a4.692 4.692 0 0 1-2.104.08a4.661 4.661 0 0 0 4.352 3.234a9.348 9.348 0 0 1-5.786 1.995a9.5 9.5 0 0 1-1.112-.065a13.175 13.175 0 0 0 7.14 2.093c8.57 0 13.255-7.098 13.255-13.254c0-.2-.005-.402-.014-.602a9.47 9.47 0 0 0 2.323-2.41l.002-.003z" fill="currentColor"/></g></svg>
                        </a>
                    </div>
                </button>
            </div>
            <div class="flex-1 text-right">
                <p class="text-green-400 font-bold text-xl">L.{{price}}</p>
            </div>
        </div>
    </div>
    {{endfor products}}
    <section class="my-4 w-full col-span-1 md:col-span-3 lg:col-span-4 xl:col-span-5">
        <div class="bg-white px-4 py-3 flex items-center justify-between border-t border-gray-200 sm:px-6">
            <div class="flex-1 flex justify-between sm:hidden">
                <a href="#" class="relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50">
                Previous
                </a>
                <a href="#" class="ml-3 relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50">
                Next
                </a>
            </div>
            <div class="hidden sm:flex-1 sm:flex sm:items-center sm:justify-between">
                <div>
                <p class="text-sm text-gray-700">
                    Showing&nbsp;
                    <span class="font-medium">1&nbsp;</span>
                    to&nbsp;
                    <span class="font-medium">10&nbsp;</span>
                    of&nbsp;
                    <span class="font-medium">97&nbsp;</span>
                    results
                </p>
                </div>
                <div>
                <nav class="relative z-0 inline-flex rounded-md shadow-sm -space-x-px" aria-label="Pagination">
                    <a href="#" class="relative inline-flex items-center px-2 py-2 rounded-l-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50">
                    <span class="sr-only">Previous</span>
                    <!-- Heroicon name: solid/chevron-left -->
                    <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                        <path fill-rule="evenodd" d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z" clip-rule="evenodd" />
                    </svg>
                    </a>
                    <!-- Current: "z-10 bg-indigo-50 border-indigo-500 text-indigo-600", Default: "bg-white border-gray-300 text-gray-500 hover:bg-gray-50" -->
                    <a href="#" aria-current="page" class="z-10 bg-indigo-50 border-indigo-500 text-indigo-600 relative inline-flex items-center px-4 py-2 border text-sm font-medium">
                    1
                    </a>
                    <a href="#" class="bg-white border-gray-300 text-gray-500 hover:bg-gray-50 relative inline-flex items-center px-4 py-2 border text-sm font-medium">
                    2
                    </a>
                    <a href="#" class="bg-white border-gray-300 text-gray-500 hover:bg-gray-50 hidden md:inline-flex relative items-center px-4 py-2 border text-sm font-medium">
                    3
                    </a>
                    <span class="relative inline-flex items-center px-4 py-2 border border-gray-300 bg-white text-sm font-medium text-gray-700">
                    ...
                    </span>
                    <a href="#" class="bg-white border-gray-300 text-gray-500 hover:bg-gray-50 hidden md:inline-flex relative items-center px-4 py-2 border text-sm font-medium">
                    8
                    </a>
                    <a href="#" class="bg-white border-gray-300 text-gray-500 hover:bg-gray-50 relative inline-flex items-center px-4 py-2 border text-sm font-medium">
                    9
                    </a>
                    <a href="#" class="bg-white border-gray-300 text-gray-500 hover:bg-gray-50 relative inline-flex items-center px-4 py-2 border text-sm font-medium">
                    10
                    </a>
                    <a href="#" class="relative inline-flex items-center px-2 py-2 rounded-r-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50">
                    <span class="sr-only">Next</span>
                    <!-- Heroicon name: solid/chevron-right -->
                    <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                        <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd" />
                    </svg>
                    </a>
                </nav>
                </div>
            </div>
        </div>
    </section>
</section>
<script>
    document.addEventListener("DOMContentLoaded", () => {
        
        const products = document.getElementsByClassName("product");
        const shareBtns = document.getElementsByClassName("btnShare");
        
        for (let product of products){
            product.addEventListener("click",() => {
                showProductDetail(product.id);
            });
        }

        for (let btn of shareBtns){
            btn.addEventListener("mouseenter",() => {
                const shareOpts = document.getElementById("shareOpt"+btn.value);
                shareOpts.classList.remove('hidden');
            });

            btn.addEventListener("mouseleave", () => {
                const shareOpts = document.getElementById("shareOpt"+btn.value);
                shareOpts.classList.add('hidden');
            });
        }

        function showProductDetail(id){
            const btnShow = document.getElementById("btnShow"+id);
            console.log(btnShow);
        }
    });
</script>