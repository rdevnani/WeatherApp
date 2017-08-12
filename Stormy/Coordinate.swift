//
//  Coordinate.swift
//  Stormy
//
//  Created by Rohit Devnani on 10/8/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

// We are creating this for our location. latitute and longitute will be the coordinates of our location on this planet.
struct Coordinate {
    let latitude: Double
    let longitude: Double
}


// Here we are converting Double to String
extension Coordinate: CustomStringConvertible {
    var description: String {
        return "\(latitude),\(longitude)"
    }
}












