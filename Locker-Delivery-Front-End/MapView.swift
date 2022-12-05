//
//  MapView.swift
//  Locker-Delivery-Front-End
//
//  Created by Pranav Kandarpa on 12/4/22.
//

import MapKit
import SwiftUI
import Firebase

struct MapView: View {
    
    
//    @Binding var next: Int
//    @Binding var uid: String
//    @Binding var currTransaction: Transaction
    
    @State private var directions : [String] = []
    @State private var showDirections = false

    var body: some View {
        VStack {
            GeoView(directions: $directions)
            
            Button(action: {
                self.showDirections.toggle()
            }, label: {
                Text("Show Directions")
            })
            .disabled(directions.isEmpty)
            .padding()
        }.sheet(isPresented: $showDirections, content: {
            VStack {
                Text("Directions").font(.largeTitle).bold().padding()
                Divider().background(Color.blue)
                
                List {
                    ForEach(0..<self.directions.count, id: \.self) { i in Text(self.directions[i])}
                }
            }
        })
            
    }

    
}

struct Content_Previews: PreviewProvider {
    static var previews: some View {
//        print(MapView.location)
        MapView()
    }
}

struct GeoView: UIViewRepresentable {
    
    typealias UIViewType = MKMapView
    
    @Binding var directions: [String]
    
    func makeCoordinator() -> MapViewCoordinator {
        return MapViewCoordinator()
    }
    
    func makeUIView(context: Context) -> MKMapView {
        
        let mapView = MKMapView()
        
        mapView.delegate = context.coordinator
        
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.71, longitude: -74), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        
        mapView.setRegion(region, animated: true)
        //locker location gatech
        let p1 = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 33.7833, longitude: -84.3831))
        
        //user location
        let p2 = MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 42.36, longitude: -71.05))
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: p1)
        request.destination = MKMapItem(placemark: p2)
        
        request.transportType = .automobile
        
        let directions = MKDirections(request: request)
        
        directions.calculate { response, error in
            guard let route = response?.routes.first else {return}
            mapView.addAnnotations([p1, p2])
            mapView.addOverlay(route.polyline)
            mapView.setVisibleMapRect(
                route.polyline.boundingMapRect,
                edgePadding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20),
                animated: true
            )
            self.directions = route.steps.map { $0.instructions }.filter { !$0.isEmpty }
        }
        
        
        return mapView
    }
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
    
    class MapViewCoordinator: NSObject, MKMapViewDelegate {
        
        var locationManager: CLLocationManager?
        
        @Published var area = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude:33.7833, longitude:-84.3831),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
        
        func ifEnabled() {
            if CLLocationManager.locationServicesEnabled() {
                locationManager = CLLocationManager()
                locationManager?.desiredAccuracy = kCLLocationAccuracyBestForNavigation
    //            locationManager!.delegate = self
            } else {
                print("Location retrieval failed")
            }
        }

        private func checkAuth() {
            guard let locationManager = locationManager else { return }

            switch locationManager.authorizationStatus {

            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .restricted:
                print("Location not permitted")
            case .denied:
                print("Location service denied")
            case .authorizedAlways:
                area = MKCoordinateRegion(
                    center: locationManager.location!.coordinate,
                    span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                    )
            case .authorizedWhenInUse:
                area = MKCoordinateRegion(
                    center: locationManager.location!.coordinate,
                    span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                    )
            @unknown default:
                break
            }
        }

        func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
            checkAuth()
        }

        func getLocation(for mapView: MKMapView) -> CLLocation {
            let latitude = mapView.centerCoordinate.latitude
            let longitude = mapView.centerCoordinate.longitude

            return CLLocation(latitude: latitude, longitude: longitude)
        }
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = .blue
            renderer.lineWidth = 5
            return renderer
        }
    }
    
    
}
