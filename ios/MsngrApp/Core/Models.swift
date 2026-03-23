import Foundation

struct UserProfile: Identifiable, Codable, Hashable {
    let id: UUID
    var displayName: String
    var avatarURL: URL?
    var phoneNumber: String
}

struct Group: Identifiable, Codable, Hashable {
    let id: UUID
    var name: String
    var avatarURL: URL?
    var admins: [UUID]
    var participantIDs: [UUID]
}

struct Message: Identifiable, Codable, Hashable {
    enum ContentType: String, Codable {
        case text
        case image
        case location
    }

    let id: UUID
    let groupID: UUID
    let senderID: UUID
    let sentAt: Date
    var body: String
    var contentType: ContentType
    var location: GeoPoint?
}

struct GeoPoint: Codable, Hashable {
    let latitude: Double
    let longitude: Double
}

struct ConnectivityStatus {
    var isOnline: Bool
    var carrierHint: String
}
