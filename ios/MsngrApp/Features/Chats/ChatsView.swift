import SwiftUI

struct ChatsView: View {
    @EnvironmentObject private var session: SessionStore

    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {
                if !session.connectivity.status.isOnline {
                    Label("Нет интернета. Сообщения будут отправлены после подключения.", systemImage: "wifi.slash")
                        .font(.footnote)
                        .padding(10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.red.opacity(0.12))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }

                List(session.groups) { group in
                    NavigationLink {
                        GroupChatView(group: group)
                    } label: {
                        HStack {
                            Circle()
                                .fill(ColorTheme.secondaryBlue)
                                .frame(width: 40, height: 40)
                                .overlay(Text(group.name.prefix(1)).font(.headline))
                            VStack(alignment: .leading) {
                                Text(group.name)
                                Text("Участников: \(group.participantIDs.count)")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
                .listStyle(.plain)
            }
            .padding()
            .navigationTitle("MSNGR")
            .task { await session.loadGroups() }
        }
    }
}

private struct GroupChatView: View {
    let group: Group
    @State private var messageText = ""

    var body: some View {
        VStack {
            ScrollView {
                Text("Переписка группы \(group.name)")
                    .padding()
            }
            HStack {
                TextField("Сообщение или эмоджи 😊", text: $messageText)
                    .textFieldStyle(.roundedBorder)
                Button("Отправить") {}
                    .buttonStyle(.borderedProminent)
                    .tint(ColorTheme.primaryBlue)
            }
            .padding()
        }
        .navigationTitle(group.name)
        .toolbar {
            NavigationLink {
                LiveLocationView(group: group)
            } label: {
                Image(systemName: "location.fill")
            }
        }
    }
}
