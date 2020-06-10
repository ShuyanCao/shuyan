//
//  weather.swift
//  assignment3-teamHotpot
//
//  Created by 罗雅愉 on 9/6/2020.
//  Copyright © 2020 罗雅愉. All rights reserved.
//

import Foundation

protocol WeatherControlDelegate {
    func didUpdateWeather(_ weatherControler: WeatherControl, weather: weatherMode)
    func didFailWithError(_ erro:Error)
}

struct WeatherControl {
    //secure load url resource with https
    let weatherURL =
    "https://api.openweathermap.org/data/2.5/weather?appid=95eb8f160c62491fde03591925a3fbc9&units=metric"
    var delegate: WeatherControlDelegate?

func fetchWeather(cityName: String) {
    let urlString = "\(weatherURL)&q=\(cityName)"
    self.performanceRequest(with: urlString)
}
    
    func performanceRequest(with urlString: String){
        //create url
        if let url = URL(string: urlString) {
        //create a URL session
        let session = URLSession(configuration: .default)
        // give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    self.delegate?.didFailWithError(error!)
                       //if error the process would not continue
                       return
                   }
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
            }
            }
        //start task, initialized tasks begin in a suspended state
        task.resume()
    }
    }
  
    func parseJSON(_ weatherDatabase: Data) -> weatherMode? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherDatabase.self, from: weatherDatabase)
        let id = decodedData.weather[0].id
        let temp = decodedData.main.temp
        let name = decodedData.name
            
        let weather = weatherMode(conditionId: id, cityName: name, temperature: temp)
        return weather
            
        } catch {
            delegate?.didFailWithError(error)
            return nil
        }
        
        }
   
    }
