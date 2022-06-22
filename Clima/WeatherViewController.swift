//
//  ViewController.swift
//  Clima
//
//  Created by tetsuta matsuyama on 2022/06/20.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController, UITextFieldDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.delegate = self
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        
    }

//MARK: - CLLocationManagerDelegate
    
    @IBAction func locationPressed(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
    

    
//MARK: - UITextFieldDelegate
    
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"  // For Alert
            return false
        }
    }

    
    //TODO: Need fetchWeather(cityName: city) method
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text {
            print(city)
        }
        searchTextField.text = ""
    }

}

