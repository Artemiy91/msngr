<?php

declare(strict_types=1);

$routes = require __DIR__ . '/php/routes.php';
$path = parse_url($_SERVER['REQUEST_URI'] ?? '/', PHP_URL_PATH) ?: '/';
$path = rtrim($path, '/') ?: '/';

if (isset($routes[$path])) {
    require __DIR__ . '/' . $routes[$path];
    return;
}

http_response_code(404);
require __DIR__ . '/pages/404.php';
