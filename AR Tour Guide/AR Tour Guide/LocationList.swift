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
    func addLocation(location: Location) {
        locations.append(location)
        return
    }
    func isInAnyLocation(user: CLLocationCoordinate2D) -> String {
        for i in locations {
            if(i.isInLocation(user: user)) {
                return i.getName()
            }
        }
        return "NOT IN ANY LOCATION"
    }
}
