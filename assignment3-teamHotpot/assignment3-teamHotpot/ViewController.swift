//
//  ViewController.swift
//  assignment3-teamHotpot
//
//  Created by 罗雅愉 on 9/6/2020.
//  Copyright © 2020 罗雅愉. All rights reserved.
//

import UIKit

class ViewController: UIViewController, WeatherControlDelegate {

   
    @IBOutlet weak var conditionalImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var searchTextfield: UITextField!
    @IBOutlet weak var cityLabel: UILabel!
    
    var weatherControl = WeatherControl()
   
    
override func viewDidLoad() {
        super.viewDidLoad()
        searchTextfield.delegate = self
        weatherControl.delegate = self

    }
    }

extension ViewController: UITextFieldDelegate {
    @IBAction func searchButton(_ sender: UIButton) {
        searchTextfield.endEditing(true)
        print(searchTextfield.text!)

    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextfield.endEditing(true)
        print(searchTextfield.text!)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "city"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //
        if let city = searchTextfield.text {
            weatherControl.fetchWeather(cityName: city)
        }
        searchTextfield.text = ""
        
    }
   
  
    func didUpdateWeather(_ weatherControl: WeatherControl, weather: weatherMode) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.cityLabel.text = weather.cityName
            self.conditionalImageView.image = UIImage(systemName: weather.conditionString)
        }
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }


}
