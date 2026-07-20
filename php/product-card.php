<article class="product-card reveal">
  <div class="product-image">
    <img src="<?= htmlspecialchars($p[5]) ?>" alt="<?= htmlspecialchars($p[0]) ?>" width="640" height="430" <?= $i === 0 ? 'fetchpriority="high"' : 'loading="lazy"' ?>>
    <span class="badge">В наличии</span>
  </div>
  <div class="product-body">
    <span class="weight">Вес товара: <?= htmlspecialchars($p[1]) ?></span>
    <h3><?= htmlspecialchars($p[0]) ?></h3>
    <div class="price-row"><b><?= htmlspecialchars($p[2]) ?></b><span>Замена: <?= htmlspecialchars($p[3]) ?></span></div>
    <p class="delivery">Доставка: <?= htmlspecialchars($p[4]) ?></p>
    <a class="btn btn-card" href="#contact">Купить</a>
  </div>
</article>
