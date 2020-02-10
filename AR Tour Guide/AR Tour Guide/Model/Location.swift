//
//  Location.swift
//  AR Tour Guide
//
//  Created by Daniel on 2/1/20.
//  Copyright © 2020 Creative Labs. All rights reserved.
//

import Foundation
import CoreLocation

public struct Location {
    
    let coord1: CLLocationCoordinate2D
    let coord2: CLLocationCoordinate2D
    let name: String
    
    init(coord1: CLLocationCoordinate2D, coord2: CLLocationCoordinate2D, name: String) {
        self.coord1 = coord1
        self.coord2 = coord2
        self.name = name
    }
    
    func getName() -> String { return name }
    
    func isInLocation(user: CLLocationCoordinate2D) -> Bool {
        if((user.latitude < coord1.latitude && user.latitude > coord2.latitude) || (user.latitude > coord1.latitude && user.latitude < coord2.latitude)) {
            if((user.longitude < coord1.longitude && user.longitude > coord2.longitude) || (user.longitude > coord1.longitude && user.longitude < coord2.longitude)) {
                return true
            }
        }
        return false
    }
    
}

