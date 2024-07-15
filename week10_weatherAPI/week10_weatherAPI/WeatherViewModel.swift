//
//  WeatherViewModel.swift
//  week10_weatherAPI
//
//  Created by 이상엽 on 6/19/24.

//역할: View와 WeatherService 사이의 데이터 로직을 관리하는 ViewModel 클래스

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var weather: WeatherData?
    private let weatherService = WeatherService()

    func fetchWeather(for city: String) {
        weatherService.fetchWeather(for: city) { weatherData in
            self.weather = weatherData
        }
    }
}
