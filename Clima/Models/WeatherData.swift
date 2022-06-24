//
//  WeatherData.swift
//  Clima
//
//  Created by tetsuta matsuyama on 2022/06/24.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let description: String
    let id: Int
}
