import SwiftUI

struct GroupsView: View {
    @EnvironmentObject private var session: SessionStore
    @State private var groupName = ""

    var body: some View {
        NavigationStack {
            Form {
                Section("Создать группу (только админ)") {
                    TextField("Название", text: $groupName)
                    Button("Добавить") {
                        guard !groupName.isEmpty else { return }
                        let group = Group(
                            id: UUID(),
                            name: groupName,
                            avatarURL: nil,
                            admins: [session.currentUser.id],
                            participantIDs: [session.currentUser.id]
                        )
                        session.groups.append(group)
                        groupName = ""
                    }
                }

                Section("Группы") {
                    ForEach(session.groups) { group in
                        HStack {
                            Image(systemName: "person.3.fill")
                                .foregroundStyle(ColorTheme.primaryBlue)
                            Text(group.name)
                            Spacer()
                            if group.admins.contains(session.currentUser.id) {
                                Text("admin")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Группы")
        }
    }
}
