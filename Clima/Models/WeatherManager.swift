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
        performRequest(with: urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(weatherURL)&appid=\(apiKey)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
    }
    
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeDate = data {
                    let dataString = String(data: safeDate, encoding: .utf8)
                    print(dataString!)
                }
            }
            task.resume()
        }
    }
}
    
    

