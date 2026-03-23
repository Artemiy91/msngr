import Foundation

@MainActor
final class SessionStore: ObservableObject {
    @Published var currentUser = UserProfile(
        id: UUID(),
        displayName: "Новый пользователь",
        avatarURL: nil,
        phoneNumber: "+7"
    )

    @Published var groups: [Group] = []
    @Published var selectedGroup: Group?

    let permissions = PermissionManager()
    let connectivity = ConnectivityMonitor()
    let remoteStore: RemoteStore

    init(remoteStore: RemoteStore = APIStore()) {
        self.remoteStore = remoteStore
    }

    func loadGroups() async {
        do {
            groups = try await remoteStore.fetchGroups(for: currentUser.id)
        } catch {
            print("Failed to load groups: \(error)")
        }
    }
}
