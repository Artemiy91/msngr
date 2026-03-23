import SwiftUI

@main
struct MsngrApp: App {
    @StateObject private var session = SessionStore()

    var body: some Scene {
        WindowGroup {
            RootTabView()
                .environmentObject(session)
                .preferredColorScheme(.light)
                .tint(ColorTheme.primaryBlue)
        }
    }
}
