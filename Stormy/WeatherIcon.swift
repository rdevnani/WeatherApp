//
//  WeatherIcon.swift
//  Stormy
//
//  Created by Screencast on 2/22/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation
import UIKit


enum WeatherIcon { // Doing enum because (Developers should ensure that a sensible default is defined, as additional values, such as hail, thunderstorm, or tornado, may be defined in the FUTURE. - so we can add more in furture and let enum do the job) Another reason is, if we want to chance out prefrences to how weather on daily or say weekly basis. In that case we can use this Weathericon file.
    case clearDay
    case clearNight
    case rain
    case snow
    case sleet
    case wind
    case fog
    case cloudy
    case partlyCloudyDay
    case partlyCloudyNight
    case `default` // As default is already a reserved keywoard. So we have to use ' ' to declare as a member of enum
    
    init(iconString: String) {
        switch iconString {
        case "clear-day": self = .clearDay
        case "clear-night": self = .clearNight
        case "rain": self = .rain
        case "snow": self = .snow
        case "sleet": self = .sleet
        case "wind": self = .wind
        case "fog": self = .fog
        case "cloudy": self = .cloudy
        case "partly-cloudy-day": self = .partlyCloudyDay
        case "partly-cloudy-night": self = .partlyCloudyNight
        default: self = .default
        }
    }
}

extension WeatherIcon {
    var image: UIImage { // UI Image is part of the UIImage Framework.
        switch self {
        case .clearDay: return #imageLiteral(resourceName: "clear-day")
        case .clearNight: return #imageLiteral(resourceName: "clear-night")
        case .rain: return #imageLiteral(resourceName: "rain")
        case .snow: return #imageLiteral(resourceName: "snow")
        case .sleet: return #imageLiteral(resourceName: "sleet")
        case .wind: return #imageLiteral(resourceName: "wind")
        case .fog: return #imageLiteral(resourceName: "fog")
        case .cloudy: return #imageLiteral(resourceName: "cloudy")
        case .partlyCloudyDay: return #imageLiteral(resourceName: "partly-cloudy-day")
        case .partlyCloudyNight: return #imageLiteral(resourceName: "partly-cloudy-night")
        case .default: return #imageLiteral(resourceName: "default")
        }
    }
}


















