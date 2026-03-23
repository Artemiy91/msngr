import Foundation

protocol RemoteStore {
    func fetchGroups(for userID: UUID) async throws -> [Group]
    func fetchMessages(groupID: UUID) async throws -> [Message]
    func send(_ message: Message) async throws
    func createGroup(_ group: Group) async throws
    func updateLiveLocation(userID: UUID, groupID: UUID, point: GeoPoint) async throws
}

final class APIStore: RemoteStore {
    private let baseURL: URL
    private let session: URLSession

    init(baseURL: URL = AppConfig.apiBaseURL, session: URLSession = .shared) {
        self.baseURL = baseURL
        self.session = session
    }

    func fetchGroups(for userID: UUID) async throws -> [Group] {
        _ = (baseURL, session, userID)
        return []
    }

    func fetchMessages(groupID: UUID) async throws -> [Message] {
        _ = (baseURL, session, groupID)
        return []
    }

    func send(_ message: Message) async throws {
        _ = (baseURL, session, message)
    }

    func createGroup(_ group: Group) async throws {
        _ = (baseURL, session, group)
    }

    func updateLiveLocation(userID: UUID, groupID: UUID, point: GeoPoint) async throws {
        _ = (baseURL, session, userID, groupID, point)
    }
}
