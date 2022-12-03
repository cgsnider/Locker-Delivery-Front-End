//
//  Mapping.swift
//  Locker-Delivery-Front-End
//
//  Created by Pranav Kandarpa on 11/30/22.
//
import MapKit
import SwiftUI
import Firebase

struct MapView: View {
    
    
//    @Binding var next: Int
//    @Binding var uid: String
//    @Binding var currTransaction: Transaction

//    @StateObject private var viewMap = MapViewModel()

    var body: some View {
        Text("start")
//        Map(coordinateRegion: $viewMap.area, showsUserLocation: true)
//            .ignoresSafeArea()
//            .onAppear {
//                viewMap.ifEnabled()
//            }
            
    }

    
}
// This function will be replaced during firebase connection
//class LocationDataModel: ObservableObject {
//
////    @Published var list = [Locations]()
//    let location = ""
//
//
//    func getLocation(isReceiver: Bool, uid: String, currTransaction: Transaction) {
//
//        let db = Firestore.firestore()
//
//        let location = currTransaction.locker_location // locker location string
//
//        let locker_location = db.collection("locations").document(location)
//
//        let locker_long = locker_location
//        let locker_lat =
//
//
//
////
////        let user_location = db.collection("transaction")
//
//
//
//    }
//}

//final class MapViewModel : NSObject, ObservableObject, CLLocationManagerDelegate {
//
//    @IBOutlet weak var mapView: MKMapView!
//
//    @Published var area = MKCoordinateRegion(
//        center: CLLocationCoordinate2D(latitude:33.7833, longitude:-84.3831),
//        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
//    )
//    var locationManager: CLLocationManager?
    
//    func ifEnabled() {
//        if CLLocationManager.locationServicesEnabled() {
//            locationManager = CLLocationManager()
//            locationManager?.desiredAccuracy = kCLLocationAccuracyBestForNavigation
//            locationManager!.delegate = self
//        } else {
//            print("Location retrieval failed")
//        }
//    }
    
//    private func checkAuth() {
//        guard let locationManager = locationManager else { return }
//
//        switch locationManager.authorizationStatus {
//
//        case .notDetermined:
//            locationManager.requestWhenInUseAuthorization()
//        case .restricted:
//            print("Location not permitted")
//        case .denied:
//            print("Location service denied")
//        case .authorizedAlways:
//            area = MKCoordinateRegion(
//                center: locationManager.location!.coordinate,
//                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
//                )
//        case .authorizedWhenInUse:
//            area = MKCoordinateRegion(
//                center: locationManager.location!.coordinate,
//                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
//                )
//        @unknown default:
//            break
//        }
//    }
//
//    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
//        checkAuth()
//    }
//
//    func getLocation(for mapView: MKMapView) -> CLLocation {
//        let latitude = mapView.centerCoordinate.latitude
//        let longitude = mapView.centerCoordinate.longitude
//
//        return CLLocation(latitude: latitude, longitude: longitude)
//    }
    
//    func getDirections() {
//        guard let location = locationManager?.location?.coordinate else {
//            return
//        }
//        let request = directionsRequest(from: location)
//        let directions = MKDirections(request: request)
//        directions.calculate([unowned self] (response, error) in guard let response = response else {return}
//                             for route
//        )
//    }
    
//    func directionsRequest(from coordinate: CLLocationCoordinate2D) -> MKDirections.Request {
//        let dest_coordinate = getLocation(for: mapView).coordinate
//        let starting = MKPlacemark(coordinate: coordinate)
//        let dest = MKPlacemark(coordinate: dest_coordinate)
//
//        let request =  MKDirections.Request()
//        request.source = MKMapItem(placemark: starting)
//        request.destination = MKMapItem(placemark: dest)
//        request.transportType = .automobile
//        request.requestsAlternateRoutes = true
//
//        return request
//
//
//
//    }
    
//}




struct Content_Previews: PreviewProvider {
    static var previews: some View {
//        print(MapView.location)
        MapView()
    }
}

