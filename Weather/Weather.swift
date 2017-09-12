//
// Weather.swift
//  Weather
//
//  Created by Quốc Đạt on 09.09.17.
//  Copyright © 2017 QuocDat. All rights reserved.
//

import Foundation

struct Weather: Codable {
    let location: Location
    let current: Current
    let forecast: Forecast
}
struct Location: Codable {
    let name: String
}
struct Current: Codable {
    let temp_c: Double
    let condition: Condition
    let last_updated_epoch: TimeInterval
}

struct Forecast: Codable {
    let forecastday:[ForecastDay]
}

struct ForecastDay: Codable {
    let hour: [Hour]
    let day: Day
    let date_epoch: TimeInterval
}

struct Day: Codable {
    let maxtemp_c: Double
    let mintemp_c: Double
    let condition: Condition
}


struct Hour: Codable {
    let time_epoch: TimeInterval
    let temp_c: Double
    let condition: Condition
}

struct WeatherOfAnHour: Codable {
    let time_epoch: TimeInterval
    let temp_c: Double
    let condition: Condition
}
struct Condition: Codable {
    let icon: String
    let text: String
}
