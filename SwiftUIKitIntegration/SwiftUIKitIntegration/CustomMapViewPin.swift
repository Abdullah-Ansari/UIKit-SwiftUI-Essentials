//
//  CustomMapViewPin.swift
//  SwiftUIKitIntegration
//
//  Created by Abdullah Ansari on 25/05/25.
//

import SwiftUI
import MapKit

class AppleMarkerAnnotationView: MKAnnotationView {
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        
        frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        centerOffset = CGPoint(x: 0, y: -frame.size.height/2)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder: ) has not been implemented.")
    }
    
    private func setup() {
        let imageView = UIImageView(image: UIImage(systemName: "applelogo"))
        self.addSubview(imageView)
        imageView.frame = self.bounds
    }
}

class MapViewCoordinator: NSObject, MKMapViewDelegate {
    
    var mapView: MKMapView?
    
    override init() {
        super.init()
        registerMapAnnotationViews()
    }
    
    private func registerMapAnnotationViews() {
        
        guard let mapView = mapView else { return }
        
        mapView.register(AppleMarkerAnnotationView.self, forAnnotationViewWithReuseIdentifier: NSStringFromClass(AppleMarkerAnnotationView.self))
        
    }
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: any MKAnnotation) -> MKAnnotationView? {
        switch annotation {
        case is MKPointAnnotation:
            return AppleMarkerAnnotationView(annotation: annotation, reuseIdentifier: NSStringFromClass(AppleMarkerAnnotationView.self))
        default:
            return nil
        }
    }
    
}

struct MapView: UIViewRepresentable {

    typealias UIViewType = MKMapView

    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        
        map.delegate = context.coordinator
        context.coordinator.mapView = map
        
        // add notation
        let pointAnnotation = MKPointAnnotation()
        pointAnnotation.title = "Apple Campus"
        let coordinate = CLLocationCoordinate2D(latitude: 37.331821, longitude: -122.031181)
        pointAnnotation.coordinate = coordinate
        
        // region
        let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 10_0000, longitudinalMeters: 100_000)
        map.setRegion(region, animated: false)
        
        map.addAnnotation(pointAnnotation)
        return map
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
    
    func makeCoordinator() -> MapViewCoordinator {
        MapViewCoordinator()
    }
    
}

struct CustomMapViewPin: View {
    var body: some View {
        MapView()
    }
}

#Preview {
    CustomMapViewPin()
}
