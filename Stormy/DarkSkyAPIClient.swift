//
//  DarkSkyAPIClient.swift
//  Stormy
//
//  Created by Rohit Devnani on 10/8/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

// This is to interact with DarkSky API and return the weather/Details
class DarkSkyAPIClient {
    fileprivate let apiKey = "COPY PASTE YOUR DARKSKY PRIVATE KEY HERE" // FilePrivate store this in this file only
    
    // Creating a base URl 
    lazy var baseUrl: URL = {
        return URL(string: "https://api.darksky.net/forecast/\(self.apiKey)/")! // ok for now because we want the code to crash if URL is not created
    } ()

    let downloader = JSONDownloader()
    
    typealias CurrentWeatherCompletionHandler = (CurrentWeather?, DarkSkyError?) -> Void
    
    func getCurrentWeather(at coordinate: Coordinate, completionHandler completion: @escaping CurrentWeatherCompletionHandler) {
        
        guard let url = URL(string: coordinate.description, relativeTo: baseUrl) else {
            completion(nil, .invalidUrl)
            return
        }
        
        let request = URLRequest(url: url)
        
        let task = downloader.jsonTask(with: request) { json, error in
            
            // if u r on a Background queue and u want to make changes to the UI call this
            DispatchQueue.main.async {
                // Checking if JSON is Nil
                guard let json = json else {
                    completion(nil, error)
                    return
                }
                // Now we are creating a nested Dictionary
                guard let currentWeatherJson = json["currently"] as? [String: AnyObject], let currentWeather = CurrentWeather(json: currentWeatherJson) else {
                    completion(nil, .jsonParsingFailure)
                    return
                }
                // Calling the model
                completion(currentWeather, nil)
            }
        }
        
        task.resume()
    }
}



































