//
//  SevenDaysWeatherTableViewCell.swift
//  Weather
//
//  Created by Quốc Đạt on 10.09.17.
//  Copyright © 2017 QuocDat. All rights reserved.
//

import UIKit

class SevenDaysWeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var sevenDateLabel: UILabel!
    @IBOutlet weak var maxDegreeLabel: UILabel!
    @IBOutlet weak var minDegreeLabel: UILabel!
    @IBOutlet weak var conditionImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
