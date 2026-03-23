import Foundation

enum AppConfig {
    static var apiBaseURL: URL {
        guard
            let url = Bundle.main.object(forInfoDictionaryKey: "API_BASE_URL") as? String,
            let parsed = URL(string: url)
        else {
            return URL(string: "http://localhost:8080")!
        }
        return parsed
    }
}
