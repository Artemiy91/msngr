# Beach Club landing

## Запуск роутера

В проект добавлен простой PHP-роутер `router.php`. Он берёт путь из `REQUEST_URI`, ищет его в карте `php/routes.php` и подключает нужный файл страницы.

Для локального запуска используйте встроенный PHP-сервер:

```bash
php -S localhost:8000 router.php
```

После запуска доступны адреса:

- `http://localhost:8000/` — главная страница;
- `http://localhost:8000/catalog` — страница каталога;
- `http://localhost:8000/contacts` — страница контактов;
- любой неизвестный адрес отдаёт страницу `404`.

Для Apache добавлен `.htaccess`: он направляет все несуществующие файлы и папки в `router.php`.

## Как добавить новую страницу

1. Создайте файл страницы в директории `pages`, например `pages/delivery.php`.
2. Добавьте маршрут в `php/routes.php`:

```php
'/delivery' => 'pages/delivery.php',
```

3. Добавьте ссылку в `php/menu.php` или `php/footer.php`.

## Как применить роутер для MySQL

В проект добавлен файл `php/db.php` с PDO-подключением к MySQL. Он читает параметры из переменных окружения:

- `DB_HOST` — хост MySQL, по умолчанию `127.0.0.1`;
- `DB_PORT` — порт MySQL, по умолчанию `3306`;
- `DB_NAME` — имя базы, по умолчанию `beachclub`;
- `DB_USER` — пользователь, по умолчанию `root`;
- `DB_PASS` — пароль, по умолчанию пустая строка.

Пример запуска с переменными окружения:

```bash
DB_HOST=127.0.0.1 DB_NAME=beachclub DB_USER=root DB_PASS=secret php -S localhost:8000 router.php
```

Создайте таблицы командой:

```bash
mysql -u root -p beachclub < sql/schema.sql
```

Пример использования MySQL внутри страницы или блока:

```php
<?php
require_once __DIR__ . '/../php/db.php';

$products = db()
    ->query('SELECT * FROM products WHERE is_available = 1 ORDER BY id DESC')
    ->fetchAll();
```

После этого массив `$products` можно передать в шаблон карточек вместо текущего статического массива.
