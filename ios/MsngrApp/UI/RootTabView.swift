import SwiftUI

struct RootTabView: View {
    var body: some View {
        TabView {
            ChatsView()
                .tabItem { Label("Чаты", systemImage: "message") }
            GroupsView()
                .tabItem { Label("Группы", systemImage: "person.3") }
            SettingsView()
                .tabItem { Label("Настройки", systemImage: "gear") }
        }
    }
}
