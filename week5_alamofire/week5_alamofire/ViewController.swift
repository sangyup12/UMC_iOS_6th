//
//  ViewController.swift
//  week5_alamofire
//
//  Created by 이상엽 on 5/10/24.
//

import UIKit
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone, id: Int
    let name: String
    let cod: Int
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double
}

// MARK: - Main
struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

// MARK: - Sys
struct Sys: Codable {
    let type, id: Int
    let country: String
    let sunrise, sunset: Int
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, description, icon: String
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
}


class ViewController: UIViewController {

    var currentWeather : Welcome?
    let mainView = UIView()
    let mainLabel = UILabel()
    let forecastDataLabel = UILabel()
    let forecastDataLabel2 = UILabel()
    let forecastDataLabel3 = UILabel()
    let forecastDataLabel4 = UILabel()
    let refreshButton = UIButton()
    
    // 1. URL 생성
     let apiUrl = URL(string : "api.openweathermap.org/data/2.5/weather?q=seoul&appid=847834cd00922171b61fd67cae1702d3")

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        setUI()
        
    }
    func setUI(){
        view.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor) .isActive = true
        mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor) .isActive = true
        mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor) .isActive = true
        mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor) .isActive = true
        mainView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200) .isActive = true
        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200) .isActive = true
        mainView.backgroundColor = .white
        
        view.addSubview(mainLabel)
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.centerXAnchor.constraint(equalTo: mainView.centerXAnchor) .isActive = true
        mainLabel.centerYAnchor.constraint(equalTo: mainView.centerYAnchor, constant: -50) .isActive = true
        mainLabel.text = "초단기예보조회"
        mainLabel.font = UIFont.boldSystemFont(ofSize: 50)
        mainLabel.textAlignment = .center
        
        view.addSubview(forecastDataLabel)
        forecastDataLabel.translatesAutoresizingMaskIntoConstraints = false
        forecastDataLabel.centerXAnchor.constraint(equalTo: mainView.centerXAnchor) .isActive = true
        forecastDataLabel.centerYAnchor.constraint(equalTo: mainView.centerYAnchor) .isActive = true
        //forecastDataLabel.text = forecastData?.response.body.items.item[1].obsrValue
        forecastDataLabel.textAlignment = .center
        
//        view.addSubview(forecastDataLabel2)
//        forecastDataLabel2.translatesAutoresizingMaskIntoConstraints = false
//        forecastDataLabel2.centerXAnchor.constraint(equalTo: forecastDataLabel.centerXAnchor) .isActive = true
//        forecastDataLabel2.centerYAnchor.constraint(equalTo: forecastDataLabel.centerYAnchor, constant: 30) .isActive = true
//        //forecastDataLabel.text = forecastData?.response.body.items.item[1].obsrValue
//        forecastDataLabel2.textAlignment = .center
//        
//        view.addSubview(forecastDataLabel3)
//        forecastDataLabel3.translatesAutoresizingMaskIntoConstraints = false
//        forecastDataLabel3.centerXAnchor.constraint(equalTo: forecastDataLabel2.centerXAnchor) .isActive = true
//        forecastDataLabel3.centerYAnchor.constraint(equalTo: forecastDataLabel2.centerYAnchor, constant: 30) .isActive = true
//        //forecastDataLabel.text = forecastData?.response.body.items.item[1].obsrValue
//        forecastDataLabel3.textAlignment = .center
//        
//        view.addSubview(forecastDataLabel4)
//        forecastDataLabel4.translatesAutoresizingMaskIntoConstraints = false
//        forecastDataLabel4.centerXAnchor.constraint(equalTo: forecastDataLabel3.centerXAnchor) .isActive = true
//        forecastDataLabel4.centerYAnchor.constraint(equalTo: forecastDataLabel3.centerYAnchor, constant: 30) .isActive = true
//        //forecastDataLabel.text = forecastData?.response.body.items.item[1].obsrValue
//        forecastDataLabel4.textAlignment = .center
        
        view.addSubview(refreshButton)
        refreshButton.translatesAutoresizingMaskIntoConstraints = false
        refreshButton.centerXAnchor.constraint(equalTo: forecastDataLabel4.centerXAnchor) .isActive = true
        refreshButton.centerYAnchor.constraint(equalTo: forecastDataLabel4.centerYAnchor, constant: 40) .isActive = true
        //forecastDataLabel.text = forecastData?.response.body.items.item[1].obsrValue
        refreshButton.setTitle("새로고침", for: .normal)
        refreshButton.backgroundColor = .systemBlue
        refreshButton.layer.cornerRadius = 9
    }
    
    func getData(){
        if let apiUrl = URL(string:"api.openweathermap.org/data/2.5/weather?q=seoul&appid=847834cd00922171b61fd67cae1702d3"){
            // 2. URLSession 인스턴스 생성
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: apiUrl) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let JSONdata = data{
                    print(JSONdata) //받아온 바이트 수 출력 (905 byte)
                    let dataString = String(data: JSONdata, encoding: .utf8)
                    //print(dataString!)//데이터 스트링으로 찍어보기
                    let decoder = JSONDecoder()
                    do{//JSON객체 Welcome형으로 디코딩
                        let decodeData = try decoder.decode(Welcome.self, from: JSONdata)//사용하려면 반드시 에러핸들링 해줘야함
                       // print(decodeData.response.body.items.item[0].baseDate)
                        self.currentWeather = decodeData
                        print(self.currentWeather!)
                        DispatchQueue.main.sync {
                            self.forecastDataLabel.text = "날짜 : " + (self.currentWeather?.name)!
//                            self.forecastDataLabel2.text = "시간 : " + (self.forecastData?.response.body.items.item[0].baseTime)!
//                            self.forecastDataLabel3.text = "날씨구분코드 : " + (self.forecastData?.response.body.items.item[0].category)!
//                            self.forecastDataLabel4.text = "날씨값 : " + (self.forecastData?.response.body.items.item[0].obsrValue)!
                            session.finishTasksAndInvalidate()
                            print("세션종료")
                        }
                        
                    }catch{
                        print(error)
                    }
                        
                }
            }
            task.resume()
        }
   
    }


}

