//
//  ContentViewModel.swift
//  Test
//
//  Created by Jonathan Hogue on 11/25/21.
//

import SwiftUI
import CoreLocation

final class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    var baseURL = "https://api.weatherapi.com/v1"

    var APIKey = "?key=7c145ce76f2549af8b4144902210511"

    var city: String = "Greece"

    enum RequestType: String {
        case currentWeather = "/current.json"
        case forecast = "/forecast.json"
    }

    @Published var responseWeatherData: WeatherStruct?
    @Published var loadingProgress: Double?

    var returnData: Data?
    
    //location variables:
    var locationManager: CLLocationManager?
    
    // Location services calls
    func checkIfServicesAreEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
        } else {
            print("Show alert that location services are off")
        }
    }
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("location is restricted, check parental controls")
        case .denied:
            print("you have denied location permission, please change in settings")
        case .authorizedAlways, .authorizedWhenInUse:
            loadingProgress = 0.25
            guard let checkedLat = locationManager.location?.coordinate.latitude else {return}
            let lat = String(format: "%.5f", checkedLat)
            guard let checkedLong = locationManager.location?.coordinate.longitude else {return}
            let long = String(format: "%.5f",checkedLong)
            
            loadingProgress = 0.50
            
            guard let weatherURL = URL(string: "https://api.weatherapi.com/v1/forecast.json?key=7c145ce76f2549af8b4144902210511&q=\(lat),\(long)&days=3&aqi=no&alerts=no") else {return}
            loadingProgress = 0.75
            let dataTask = URLSession.shared.dataTask(with: weatherURL) { data, response, error in
                if let error = error {
                    print("Request error: \(error)")
                    return
                }
                guard let response = response as? HTTPURLResponse else {return}

                self.returnData = data

                switch response.statusCode {
                case 200...299:
                    guard let returnData = data else {return}
                    DispatchQueue.main.async {
                        do {
                            self.responseWeatherData = try JSONDecoder().decode(WeatherStruct.self, from: returnData)
                        } catch let error {
                            print("Error decoding: \(error)")
                        }
                    }
                    //print("HTTP response code \(response.statusCode) returned")
                case 300...399:
                    print("HTTP response code 3xx returned")

                case 400...499:
                    print("something not found, HTTP reponse code 4xx returned")

                default:
                    print("default in switch statment reached... hm")
                }
            }
            dataTask.resume()

        @unknown default:
            break
        }

    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
    
}
