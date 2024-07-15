//
//  WeatherData.swift
//  week10_weatherAPI
//
//  Created by 이상엽 on 6/19/24.

//역할: OpenWeather API에서 가져온 JSON 데이터를 Swift 객체로 매핑하기 위한 모델 정의

import Foundation

struct WeatherData: Codable {
    let main: Main
    let weather: [Weather]
    let name: String
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let description: String
    let icon: String
    
    func iconURL() -> URL? {
        return URL(string: "https://openweathermap.org/img/wn/\(icon)@2x.png")
    }
}
