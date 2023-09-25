import SwiftUI
import GoogleMaps
import GooglePlaces

struct MapViewController: UIViewRepresentable {
    let locations: [Busking] = dummyBuskingNow
    let APIKey = "AIzaSyBgin5aar0gpBJO8eV7DXH_kfo-zUHR1QQ"
    @Binding var isShowModal: Bool
    @Binding var selectedBusking: Busking?

    func makeUIView(context: Context) -> GMSMapView {
        GMSServices.provideAPIKey(APIKey)
        let camera = GMSCameraPosition.camera(withLatitude: 37.5575350, longitude: 126.9251138, zoom: 17.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.delegate = context.coordinator

        for i in locations {
            let annotationView = MapAnnotationView(busking: i)
            let uiView = createUIView(from: annotationView)
            
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: i.latitude, longitude: i.longitude)
            marker.map = mapView
            marker.iconView = uiView
            marker.userData = i  // Store Busking object in marker's userData
        }
        
        return mapView
    }
    
    func updateUIView(_ uiView: GMSMapView, context: Context) {}

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    func createUIView(from view: MapAnnotationView) -> UIView {
        let controller = UIHostingController(rootView: view)
        controller.view.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        controller.view.backgroundColor = .clear
        return controller.view
    }

    class Coordinator: NSObject, GMSMapViewDelegate {
        var parent: MapViewController

        init(parent: MapViewController) {
            self.parent = parent
        }
        
        func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
            if let busking = marker.userData as? Busking {
                parent.selectedBusking = busking
                parent.isShowModal.toggle()
            }
            return true
        }
    }
}

struct SearchBar: UIViewRepresentable {
    @Binding var text: String
    var placeholder: String
    
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.placeholder = placeholder
        searchBar.searchTextField.backgroundColor = UIColor(white: 0.1, alpha: 0.5)
        searchBar.backgroundImage = UIImage()
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }
}

struct MapViewController_Preview: PreviewProvider {
    static var previews: some View {
        MapViewController(isShowModal: .constant(false), selectedBusking: .constant(nil))
    }
}
