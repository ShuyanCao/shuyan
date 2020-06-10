//
//  weather.swift
//  assignment3-teamHotpot
//
//  Created by 罗雅愉 on 9/6/2020.
//  Copyright © 2020 罗雅愉. All rights reserved.
//

import Foundation

struct weather {
    //secure load url resource with https
    let weatherURL =
    "https://api.openweathermap.org/data/2.5/weather?appid=95eb8f160c62491fde03591925a3fbc9&units=metric"


func fetchWeather(cityName: String) {
    let urlString = "\(weatherURL)&q=\(cityName)"
    self.performanceRequest(urlString: urlString)
}
    
    func performanceRequest(urlString: String){
        //create url
        if let url = URL(string: urlString) {
        //create a URL session
        let session = URLSession(configuration: .default)
        // give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                       print(error!)
                       //if error the process would not continue
                       return
                   }
                 if let safeData = data {
                    self.parseJSON(weatherData: safeData)
            }
            }
        //start task, initialized tasks begin in a suspended state
        task.resume()
    }
    }
  
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        do{
        let decodedData = try decoder.decode(weatherDatabase.self, from: weatherData)
            let id = decodedData.weather[0].id
        } catch {
            print(error)
        }
        
        }
    func getConditionName(weatherId: Int) -> String {
        
    }
    }
