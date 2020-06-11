//
//  weatherMode.swift
//  assignment3-teamHotpot
//
//  Created by 罗雅愉 on 10/6/2020.
//  Copyright © 2020 罗雅愉. All rights reserved.
//

import Foundation

struct weatherMode {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String {
        //return double right format
        return String(format: "%.1f", temperature)
    }
    //condition name to change image in symble by catching id from database
    var conditionString: String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt"
        case 300...321:
        return "cloud.drizzle"
        case 500...531:
        return "cloud.rain"
        case 600...622:
        return "cloud.snow"
        case 701...781:
        return "cloud.fog"
        case 800:
        return "sun.max"
        case 801...804:
        return "cloud.bolt"
        default:
            return "sun.max"
        }
    } 
    
}
