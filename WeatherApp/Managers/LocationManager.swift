//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Joshua Butler on 3/17/24.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    @Published var locationError = false
    
    override init(){
        super.init()
        manager.delegate = self
    }
    
    func requestLocation(){
        isLoading = true
        manager.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
        print("didUpdateLocations called")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        isLoading = false
        locationError = true
    }
    
}
