//
//weatherData.swift
//teamHotpot
//Created by Ruoxiao HU on 10/06/2020.
//copyright © UTS IOS Autumn Group Hotpot. All rights reserved.
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


