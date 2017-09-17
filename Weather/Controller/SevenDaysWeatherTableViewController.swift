//
//  SevenDaysWeatherTableViewController.swift
//  Weather
//
//  Created by Quốc Đạt on 10.09.17.
//  Copyright © 2017 QuocDat. All rights reserved.
//

import UIKit

class SevenDaysWeatherTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(updateData), name: notificationKey, object: nil)
      
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func updateData() {
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count =  DataService.shared.weather?.forecast.forecastday.count else { return 0 }
        if count > 0 {
            return  count - 1
        } else {
            return count
            
        }
        
    }
    
  
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SevenDaysWeatherTableViewCell
        cell.sevenDateLabel.text = DataService.shared.weather?.forecast.forecastday[indexPath.row + 1].date_epoch.dayWeek()
        
        guard let maxDegree = DataService.shared.weather?.forecast.forecastday[indexPath.row + 1].day.maxtemp_c else {
            fatalError("Error")
        }
        cell.maxDegreeLabel.text = "\(maxDegree)"
        guard let minDegree = DataService.shared.weather?.forecast.forecastday[indexPath.row + 1].day.mintemp_c else {
            fatalError("Error")
        }
        cell.minDegreeLabel.text = "\(minDegree)"
        
        guard let  iconString = DataService.shared.weather?.forecast.forecastday[indexPath.row].day.condition.icon else { fatalError("Error") }
        let icon: String = "https:\(iconString)"
        cell.conditionImageView.dowloadImage(from: icon)
        
        
    
        
        return cell
    }
    
    
    
    
}



