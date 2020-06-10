//
//  ViewController.swift
//  assignment3-teamHotpot
//
//  Created by 罗雅愉 on 9/6/2020.
//  Copyright © 2020 罗雅愉. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {


    @IBOutlet weak var searchTextfield: UITextField!
    
    var Weather = weather()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextfield.delegate = self
    }


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
        if let city = searchTextfield.text {
            Weather.fetchWeather(cityName: city)
        }
        searchTextfield.text = ""
    }
}

