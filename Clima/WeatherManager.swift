//
//  WeatherManager.swift
//  Clima
//
//  Created by tetsuta matsuyama on 2022/06/23.
//

import Foundation
import CoreLocation

struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?units=metric"
    let apiKey = "YOUR_API_KEY_HERE"

    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&appid=\(apiKey)&q=\(cityName)"
        print(urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(weatherURL)&appid=\(apiKey)&lat=\(latitude)&lon=\(longitude)"
        print(urlString)
    }
    
    
}

