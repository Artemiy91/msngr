<section class="hero section" id="catalog">
  <div class="container">
    <div class="hero-copy reveal">
      <p class="eyebrow">Лето начинается здесь</p>
      <h1>Каталог товаров для яркого пляжного отдыха</h1>
      <p>Подберите зонты, полотенца, сумки и аксессуары с быстрой доставкой по России.</p>
      <a class="btn" href="#contact">Получить подборку</a>
    </div>
    <div class="product-grid first-grid">
      <?php
      $products = [
        ['Зонт Coral Shade', '1.8 кг', '3 990 ₽', '450 ₽', '390 ₽', 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=640&q=70'],
        ['Пляжная сумка Aqua', '0.6 кг', '2 190 ₽', '290 ₽', '250 ₽', 'https://images.unsplash.com/photo-1526047932273-341f2a7631f9?auto=format&fit=crop&w=640&q=70'],
        ['Коврик Sand Free', '0.9 кг', '1 790 ₽', '250 ₽', '240 ₽', 'https://images.unsplash.com/photo-1520942702018-0862200e6873?auto=format&fit=crop&w=640&q=70'],
        ['Маска Wave Pro', '0.4 кг', '2 690 ₽', '320 ₽', '220 ₽', 'https://images.unsplash.com/photo-1544551763-46a013bb70d5?auto=format&fit=crop&w=640&q=70'],
        ['Полотенце Breeze', '0.5 кг', '1 490 ₽', '190 ₽', '210 ₽', 'https://images.unsplash.com/photo-1506126613408-eca07ce68773?auto=format&fit=crop&w=640&q=70'],
        ['Термобутылка Ice', '0.3 кг', '1 290 ₽', '150 ₽', '190 ₽', 'https://images.unsplash.com/photo-1602143407151-7111542de6e8?auto=format&fit=crop&w=640&q=70'],
        ['Шезлонг Easy Rest', '4.2 кг', '5 990 ₽', '700 ₽', '590 ₽', 'https://images.unsplash.com/photo-1519046904884-53103b34b206?auto=format&fit=crop&w=640&q=70'],
        ['Очки Sunny Day', '0.1 кг', '1 990 ₽', '210 ₽', '190 ₽', 'https://images.unsplash.com/photo-1473496169904-658ba7c44d8a?auto=format&fit=crop&w=640&q=70'],
      ];
      foreach ($products as $i => $p) { require __DIR__ . '/product-card.php'; }
      ?>
    </div>
  </div>
</section>
