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

    
//MARK: - API Call method
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeDate = data {
                    self.parseJSON(safeDate)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let name = decodedData.name
            let temp = decodedData.main.temp
            let id = decodedData.weather[0].id
            print(name)
            print(temp)
            print(id)
            
        } catch {
            print(error)
        }
    }
    
}



