import Contacts
import CoreLocation
import Photos

@MainActor
final class PermissionManager: NSObject, ObservableObject {
    @Published var contactsGranted = false
    @Published var photosGranted = false
    @Published var locationGranted = false

    private let locationManager = CLLocationManager()

    override init() {
        super.init()
        locationManager.delegate = self
    }

    func requestAll() {
        CNContactStore().requestAccess(for: .contacts) { [weak self] granted, _ in
            Task { @MainActor in self?.contactsGranted = granted }
        }

        PHPhotoLibrary.requestAuthorization(for: .readWrite) { [weak self] status in
            Task { @MainActor in
                self?.photosGranted = status == .authorized || status == .limited
            }
        }

        locationManager.requestWhenInUseAuthorization()
    }
}

extension PermissionManager: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        locationGranted = manager.authorizationStatus == .authorizedAlways ||
            manager.authorizationStatus == .authorizedWhenInUse
    }
}
