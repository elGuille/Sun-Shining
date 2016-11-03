//
//  Constants.swift
//  RainyShinny
//
//  Created by Guillermo García on 30/10/2016.
//  Copyright © 2016 Guillermo García. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "3842e9930449fd7c8f7707e306acc589"

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=3842e9930449fd7c8f7707e306acc589"
let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&cnt=16&mode=json&appid=3842e9930449fd7c8f7707e306acc589"
