//
//  DarkSkyError.swift
//  Stormy
//
//  Created by Rohit Devnani on 9/8/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

enum DarkSkyError: Error {
    case requestFailed
    case responseUnsuccessful
    case invalidData
    case jsonConversionFailure
    case invalidUrl
    case jsonParsingFailure
}










