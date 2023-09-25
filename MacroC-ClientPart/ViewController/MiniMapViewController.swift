//
//  MiniMapViewController.swift
//  MacroC-ClientPart
//
//  Created by Kimjaekyeong on 2023/09/22.
//

import SwiftUI
import GoogleMaps

struct MiniMapViewController: UIViewRepresentable {
    let busking: Busking
    let APIKey = "AIzaSyBgin5aar0gpBJO8eV7DXH_kfo-zUHR1QQ"

    func makeUIView(context: Context) -> GMSMapView {
        GMSServices.provideAPIKey(APIKey)
        let camera = GMSCameraPosition.camera(withLatitude: busking.latitude, longitude: busking.longitude, zoom: 14.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)

 
            let annotationView = MapAnnotationView(busking: busking)
            let uiView = createUIView(from: annotationView)
            
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: busking.latitude, longitude: busking.longitude)
            marker.map = mapView
            marker.iconView = uiView
//            marker.userData = busking  // Store Busking object in marker's userData
       
        
        return mapView
    }
    
    func updateUIView(_ uiView: GMSMapView, context: Context) {}


    func createUIView(from view: MapAnnotationView) -> UIView {
        let controller = UIHostingController(rootView: view)
        controller.view.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        controller.view.backgroundColor = .clear
        return controller.view
    }

}

struct MiniMapViewController_Preview: PreviewProvider {
    static var previews: some View {
        MiniMapViewController(busking: dummyBusking4)
    }
}
