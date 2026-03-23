import Foundation
import Network

@MainActor
final class ConnectivityMonitor: ObservableObject {
    @Published private(set) var status = ConnectivityStatus(isOnline: true, carrierHint: "3G/4G/5G")

    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "msngr.connectivity")

    init() {
        monitor.pathUpdateHandler = { [weak self] path in
            Task { @MainActor in
                self?.status = ConnectivityStatus(
                    isOnline: path.status == .satisfied,
                    carrierHint: path.isExpensive ? "Сотовая сеть" : "Wi‑Fi"
                )
            }
        }
        monitor.start(queue: queue)
    }

    deinit {
        monitor.cancel()
    }
}
