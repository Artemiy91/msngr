# Backend DB settings

Здесь находятся **настройки базы данных** для прототипа.

## Быстрый старт

1. Скопируйте переменные окружения:
   ```bash
   cp .env.example .env
   ```
2. Измените секреты в `.env`.
3. Запустите БД:
   ```bash
   docker compose up -d
   ```

## Где что настроено

- Переменные базы (`POSTGRES_DB`, `POSTGRES_USER`, `POSTGRES_PASSWORD`, `POSTGRES_PORT`) — в `.env`.
- Подключение API к БД (`DATABASE_URL`) — в `.env`.
- Контейнер и проброс портов — в `docker-compose.yml`.
- SQL-схема таблиц сообщений/групп/локаций — в `schema.sql`.
