//
//  LocationList.swift
//  AR Tour Guide
//
//  Created by Daniel on 2/1/20.
//  Copyright © 2020 Creative Labs. All rights reserved.
//

import Foundation
import CoreLocation

class LocationList {
    
    var locations: [Location]=[]
    
    // When adding locations, always take the top left and bottom right coordinates.
    func addLocation(location: Location) {
        locations.append(location)
        return
    }
    
    func isInAnyLocation(user: CLLocationCoordinate2D) -> String {
        for location in locations {
            if(location.isInLocation(user: user)) {
                return location.getName()
            }
        }
        return "NOT IN ANY LOCATION"
    }
    
}
