//
//  CurrentWeatherViewController.swift
//  Weather
//
//  Created by Quốc Đạt on 09.09.17.
//  Copyright © 2017 QuocDat. All rights reserved.
//

import UIKit

class CurrentWeatherViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var degreeLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    
    var weather: Weather? {
        willSet {
            self.weather = DataService.shared.weather
        } didSet {
         
            
            self.nameLabel.text = self.weather?.location.name
            self.conditionLabel.text = self.weather?.current.condition.text
            guard let degree = self.weather?.current.temp_c else { return }
            self.degreeLabel.text = "\(degree)ºC"
            self.dayLabel.text = self.weather?.forecast.forecastday[0].date_epoch.dayWeek()
            
            guard let maxDegree  = self.weather?.forecast.forecastday[0].day.maxtemp_c else { return }
            self.maxTempLabel.text = "\(maxDegree)"
            guard let minDegree  = self.weather?.forecast.forecastday[0].day.mintemp_c else { return }
            self.minTempLabel.text = "\(minDegree)"
        }
    }
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(updateData), name: notificationKey, object: nil)
        DataService.shared.requestData()
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func updateData() {
        self.weather = DataService.shared.weather
    }
    
}
