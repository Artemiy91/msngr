# MSNGR iOS (SwiftUI)

Черновой прототип мессенджера в стиле WhatsApp с упором на:

- групповые чаты, где админы создают группы;
- эмоджи в сообщениях;
- аватарки пользователей и групп;
- доступ к контактам и фотогалерее;
- обмен геопозицией в реальном времени внутри группы;
- хранение сообщений и текстовых данных на удаленном сервере;
- синий UI;
- явный индикатор офлайн-статуса при отсутствии интернета;
- работа в условиях нестабильной мобильной сети (включая 3G).

## Что уже есть в прототипе

1. **SwiftUI-каркас приложения** с вкладками `Чаты`, `Группы`, `Настройки`.
2. **Создание групп админом** (локально в памяти).
3. **Поддержка эмоджи** в поле ввода текста сообщений.
4. **Экран live location** на базе `MapKit` и `CoreLocation`.
5. **Permission manager** для Contacts / Photos / Location.
6. **Connectivity monitor** на `NWPathMonitor` с офлайн-плашкой.
7. **Сервис удаленного хранения** `RemoteStore` + `APIStore` (интерфейс для backend API).

## Минимальный backend для хранения данных

Рекомендуемая схема:

- `users(id, phone, display_name, avatar_url)`
- `groups(id, name, avatar_url, created_by)`
- `group_members(group_id, user_id, role)`
- `messages(id, group_id, sender_id, content_type, body, sent_at)`
- `locations(id, group_id, user_id, lat, lon, created_at)`

Подходит PostgreSQL + WebSocket (для realtime) + REST API.

## iOS permissions (Info.plist)

Нужно добавить:

- `NSContactsUsageDescription`
- `NSPhotoLibraryUsageDescription`
- `NSLocationWhenInUseUsageDescription`
- `NSLocationAlwaysAndWhenInUseUsageDescription` (если нужно фоновое отслеживание)

## Важно

Это **архитектурный старт**. Для production-версии обязательно добавить:

- end-to-end encryption;
- очереди офлайн-доставки и ретраи;
- push-уведомления (APNs);
- модерацию и антиспам;
- политику хранения/удаления персональных данных;
- мониторинг качества в мобильных сетях РФ.
