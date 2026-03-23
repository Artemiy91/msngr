import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var session: SessionStore

    var body: some View {
        Form {
            Section("Разрешения") {
                PermissionRow(title: "Контакты", granted: session.permissions.contactsGranted)
                PermissionRow(title: "Фотогалерея", granted: session.permissions.photosGranted)
                PermissionRow(title: "Геопозиция", granted: session.permissions.locationGranted)

                Button("Запросить доступ") {
                    session.permissions.requestAll()
                }
            }

            Section("Сеть") {
                HStack {
                    Text("Статус")
                    Spacer()
                    Text(session.connectivity.status.isOnline ? "Онлайн" : "Офлайн")
                        .foregroundStyle(session.connectivity.status.isOnline ? .green : .red)
                }

                HStack {
                    Text("Тип")
                    Spacer()
                    Text(session.connectivity.status.carrierHint)
                }
            }

            Section("Россия / 3G") {
                Text("Интерфейс оптимизирован под медленные сети: все данные отправляются асинхронно и могут кэшироваться локально.")
                    .font(.footnote)
            }
        }
        .navigationTitle("Настройки")
    }
}

private struct PermissionRow: View {
    let title: String
    let granted: Bool

    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Image(systemName: granted ? "checkmark.seal.fill" : "xmark.seal")
                .foregroundStyle(granted ? .green : .red)
        }
    }
}
