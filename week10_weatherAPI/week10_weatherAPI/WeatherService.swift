//
//  WeatherService.swift
//  week10_weatherAPI
//
//  Created by 이상엽 on 6/19/24.

//역할: OpenWeather API를 호출하고 데이터를 가져오는 서비스 클래스

import Foundation

class WeatherService {
    let apiKey = "5733e4f29fc796b18626c23ac066be23"
    let baseURL = "https://api.openweathermap.org/data/2.5/weather"

    func fetchWeather(for city: String, completion: @escaping (WeatherData?) -> Void) {
        let urlString = "\(baseURL)?q=\(city)&appid=\(apiKey)&units=metric"
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }

            let weatherData = try? JSONDecoder().decode(WeatherData.self, from: data)
            DispatchQueue.main.async {
                completion(weatherData)
            }
        }.resume()
    }
}
