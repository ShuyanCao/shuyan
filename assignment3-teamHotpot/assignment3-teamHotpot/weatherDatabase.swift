//
//  weatherDatabase.swift
//  assignment3-teamHotpot
//
//  Created by 罗雅愉 on 10/6/2020.
//  Copyright © 2020 罗雅愉. All rights reserved.
//

import Foundation

struct WeatherDatabase: Codable{
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
