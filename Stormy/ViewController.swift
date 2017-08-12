//
//  ViewController.swift
//  Stormy
//
//  Created by Pasan Premaratne on 2/15/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var currentHumidityLabel: UILabel!
    @IBOutlet weak var currentPrecipitationLabel: UILabel!
    @IBOutlet weak var currentWeatherIcon: UIImageView!
    @IBOutlet weak var currentSummaryLabel: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //  fileprivate let darkSkyApiKey = "Private-Key from DarkWeb" // FilePrivate store this in this file only

    let client = DarkSkyAPIClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrentWeather()
    }
        
//        // Do any additional setup after loading the view, typically from a nib.
//        
//        let currentWeather = CurrentWeather(temperature: 85.0, humidity: 0.8, precipitationProbability: 0.1, summary: "Hot!", icon: "clear-day")
//        let currentWeatherViewModel = CurrentWeatherViewModel(model: currentWeather)
//        
//        displayWeather(using: currentWeatherViewModel)
//        
//        let base = URL(string: "https://api.darksky.net/forecast/\(darkSkyApiKey)/")
//        guard let forecaseUrl = URL(string: "37.8267,-122.4233", relativeTo: base) else { return }
//        
//        let configuration = URLSessionConfiguration.default
//        let session = URLSession(configuration: configuration)
//        
//
//        // here we are using URLData task but if we want we can also use URlDownload task if we want data to be downloaded onto our disk
//        
//        let request = URLRequest(url: forecaseUrl) // Here we are creating a request object in HTTP that defaults to what we need
//        print("Log before request on main thread ")
//        
//        let dataTask = session.dataTask(with: request) { data, response, error in
//        print("Log inside completition handler")
//        }
//
//        dataTask.resume()
//        print("Log after resume")
        
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // setting up the view here
    func displayWeather(using viewModel: CurrentWeatherViewModel) {
        currentTemperatureLabel.text = viewModel.temperature
        currentHumidityLabel.text = viewModel.humidity
        currentPrecipitationLabel.text = viewModel.precipitationProbability
        currentSummaryLabel.text = viewModel.summary
        currentWeatherIcon.image = viewModel.icon
    }
    
    @IBAction func getCurrentWeather() {
        
        toggleRefreshAnimation(on: true)
        
        let coordinate = Coordinate(latitude: 37.8136, longitude: -144.9631) // Melbourne- AUS Location
        
        client.getCurrentWeather(at: coordinate) { [unowned self] currentWeather, error in
            if let currentWeather = currentWeather {
                let viewModel = CurrentWeatherViewModel(model: currentWeather)
                self.displayWeather(using: viewModel)
                self.toggleRefreshAnimation(on: false)
            }
        }
    }
    
    func toggleRefreshAnimation(on: Bool) {
        refreshButton.isHidden = on
        
        if on {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
    
}
















