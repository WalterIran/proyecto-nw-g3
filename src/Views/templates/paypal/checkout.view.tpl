<!-- <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet"> -->
<section style="min-height: calc(100vh - 120px - 32px);" class="w-full my-auto">
  <section class="space-y-2">
    {{foreach items}}
    <div id="{{id}}" class="flex justify-between items-center h-28 pr-8 bg-white shadow-md">
        <div class="flex items-center">
            <div class="w-28">
                <img class="object-contain" src="{{img}}" alt="">
            </div>
            <div class="text-xs text-gray-600">
                <p class="font-bold text-sm text-black">{{name}}</p>
                <p>{{provider}}</p>
                <p>Precio Unidad: <span class="font-bold text-black">L.{{price}}</span></p>
                <p>SUBTOTAL (x{{cant}} artículo(s))</p>
            </div>
        </div>
        <div class="flex items-center space-x-4">
            <div class="hidden lg:block">
                <p class="text-green-500 font-bold">L. {{subtot}}</p>
            </div>
        </div>
    </div>
    {{endfor items}}
  </section>
  <section class="space-y-4 flex flex-col items-end">
    <div class="flex justify-between">
      <span class="font-extrabold text-gray-800">SUBTOTAL:&nbsp;</span>
      <span class="font-bold text-green-500 text-lg">L.{{total_bruto}}</span>
    </div>
    <div class="flex justify-between">
      <span class="font-extrabold text-gray-800">ISV (15%):&nbsp;</span>
      <span class="font-bold text-green-500 text-lg">L.{{ISV}}</span>
    </div>
    <div class="flex justify-between">
      <span class="font-extrabold text-gray-800">GRAN TOTAL:&nbsp;</span>
      <span class="font-bold text-green-500 text-lg">L.{{total}}</span>
    </div>
    <form action="index.php?page=checkout_checkout" method="post">
      <input type="hidden" name="id" id="id" value="{{id}}">
      <button class="bg-green-500 text-white font-bold px-4 py-2" type="submit">Confirmar Compra</button>
    </form>
  </section>
</section>
