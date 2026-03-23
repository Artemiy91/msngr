import CoreLocation
import MapKit
import SwiftUI

struct LiveLocationView: View {
    let group: Group

    @StateObject private var vm = LiveLocationViewModel()

    var body: some View {
        VStack(spacing: 12) {
            Map(position: $vm.cameraPosition) {
                UserAnnotation()
            }
            .mapStyle(.standard(elevation: .realistic))

            if vm.isSharing {
                Text("Геопозиция в реальном времени отправляется в группу: \(group.name)")
                    .font(.footnote)
            }

            Button(vm.isSharing ? "Остановить" : "Делиться геопозицией") {
                vm.toggleSharing()
            }
            .buttonStyle(.borderedProminent)
            .tint(ColorTheme.primaryBlue)
        }
        .padding()
        .navigationTitle("Live Location")
    }
}

@MainActor
final class LiveLocationViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var isSharing = false
    @Published var cameraPosition: MapCameraPosition = .automatic

    private let locationManager = CLLocationManager()

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }

    func toggleSharing() {
        isSharing.toggle()
        if isSharing {
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        } else {
            locationManager.stopUpdatingLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let point = locations.last?.coordinate else { return }
        cameraPosition = .region(
            MKCoordinateRegion(
                center: point,
                span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
            )
        )
    }
}
