//
//  DataService.swift
//  Weather
//
//  Created by Quốc Đạt on 09.09.17.
//  Copyright © 2017 QuocDat. All rights reserved.
//

import Foundation

let notificationKey = Notification.Name.init("requestAPI")

class DataService {
    static let shared: DataService = DataService()
//    let urlString = "https://api.apixu.com/v1/forecast.json?key=6962e8277c8e49d081c14526170709&q=Hanoi&days=7"
    var location: String?
    
    private var _weather: Weather?
    var weather: Weather? {
        get {
            if _weather == nil {
                requestData()
            }
        return _weather
        } set {
            _weather = newValue
        }
    }
    
    var forecastDay: [ForecastDay] = []
    var forecastHour:[WeatherOfAnHour] = []
    private var _weatherOfHour: [Hour]?
    
    var weatherOfHour: [Hour] {
        get {
            if _weatherOfHour == nil {
                getHour()

            }
            
            return _weatherOfHour ?? []
        }
        set {
          
            _weatherOfHour = newValue
            
        }
    }
    
    
    func getHour(){
        if let timeCurrent = weather?.current.last_updated_epoch {
            _weatherOfHour = weather?.forecast.forecastday[0].hour.filter {
                $0.time_epoch > timeCurrent
            }
        }
        for i in 0...22 {
            _weatherOfHour?.append((weather?.forecast.forecastday[1].hour[i])!)
        }
    }
    
    func requestData() {
        location = "Hanoi"
        //    let urlString = "https://api.apixu.com/v1/forecast.json?key=6962e8277c8e49d081c14526170709&q=Hanoi&days=7"
        let baseUrl = "https://api.apixu.com/v1/forecast.json?&days=7"
        var urlString = baseUrl
        var parameter : Dictionary<String, String> = [:]
        parameter["q"] = location
        parameter["key"] = "6962e8277c8e49d081c14526170709"
        
        
        for (key,value) in parameter {
            urlString += "&" + key + "=" + value
            print(urlString)
        }
        guard let url = URL(string: urlString) else { return }
        let requestURL = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: requestURL) { (data, response, error) in
            guard error == nil else { return }
            guard data != nil else { return }
            DispatchQueue.main.async {
                self._weather = try? JSONDecoder().decode(Weather.self, from: data!)
                NotificationCenter.default.post(name: notificationKey, object: nil )
            }
        }
        task.resume()
        
    }
    
}
