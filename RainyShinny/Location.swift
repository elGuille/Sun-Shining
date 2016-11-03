//
//  Location.swift
//  RainyShinny
//
//  Created by Guillermo García on 01/11/2016.
//  Copyright © 2016 Guillermo García. All rights reserved.
//

import CoreLocation


class Location {
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
}
