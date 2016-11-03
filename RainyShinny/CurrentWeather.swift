//
//  CurrentWeather.swift
//  RainyShinny
//
//  Created by Guillermo García on 30/10/2016.
//  Copyright © 2016 Guillermo García. All rights reserved.
//

import UIKit
import Alamofire


class CurrentWeather {
    private var _cityName: String!
    private var _date: String!
    private var _weatherType: String!
    private var _currentTemp: Double!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        // Tell Alamofire where to download current weather data from
        //        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
        
        // I want to download files from the URL I just gave
        
        Alamofire.request(CURRENT_WEATHER_URL).responseJSON { response in
            
            
            // Every request has a response and every response has a result
            // We create a closure that handles all the downloads
            
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, Any> {
                
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                    print(self._cityName)
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, Any>] {
                    
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                        print(self._weatherType)
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String, Any> {
                    
                    if let currentTemp = main["temp"] as? Double {
                        
                        // We need to conver Kelvin to Celcius or Farenheit
                        let kelvinToFarenheitPreDivision = (currentTemp * (9/5) - 459.67)
                        
                        let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
                        
                        self._currentTemp = kelvinToFarenheit
                        print(self._currentTemp)
                        
                        // Alternatively, append "&units=metric" to your weather url, this will send the temp in Celsius
                    }
                }
                
                
                // We must tell the function when to end.
            }
            completed()
            
        }
    }
}
