//
//  WeatherOfDayViewController.swift
//  Weather
//
//  Created by Quốc Đạt on 11.09.17.
//  Copyright © 2017 QuocDat. All rights reserved.
//

import UIKit

class WeatherOfDayViewController: UIViewController, UICollectionViewDataSource {
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = DataService.shared.weather?.forecast.forecastday[0].hour.count else { return 0  }
        if count > 0 {
            return  count
        } else {
            return count
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! WeatherOfDayCollectionViewCell
        
        if indexPath.row == 0 {
            cell.hourLabel.text = "Now"
            guard let degree = DataService.shared.weather?.current.temp_c else { fatalError("Error") }
            cell.degreeLabel.text? = "\(degree)"
            guard let  iconString = DataService.shared.weather?.current.condition.icon else { fatalError("Error") }
            let icon: String = "https:\(iconString)"
            cell.conditionImageVIew.dowloadImage(from: icon)
        }
        else {
            
            //cell.hourLabel.text =  DataService.shared.weather?.forecast.forecastday[0].hour[index].time_epoch.hourDay()
            cell.hourLabel.text = DataService.shared.weatherOfHour[indexPath.row - 1].time_epoch.hourDay()
            let degree = DataService.shared.weatherOfHour[indexPath.row - 1].temp_c
            cell.degreeLabel.text = "\(degree)"
            let iconString =  DataService.shared.weatherOfHour[indexPath.row - 1].condition.icon
            let icon: String = "https:\(iconString)"
            cell.conditionImageVIew.dowloadImage(from: icon)
            
        }
        
        return cell
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateData), name: notificationKey, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func updateData() {
        collectionView.reloadData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
