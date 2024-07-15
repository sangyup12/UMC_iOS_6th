//
//  ViewController.swift
//  week5
//
//  Created by 이상엽 on 5/9/24.
//

import UIKit
//파싱을 위한 구조체 만들기
import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let response: Response
}

// MARK: - Response
struct Response: Codable {
    let header: Header
    let body: Body
}

// MARK: - Body
struct Body: Codable {
    let dataType: String
    let items: Items
    let pageNo, numOfRows, totalCount: Int
}

// MARK: - Items
struct Items: Codable {
    let item: [Item]
}

// MARK: - Item
struct Item: Codable {
    let baseDate, baseTime, category: String
    let nx, ny: Int
    let obsrValue: String
}

// MARK: - Header
struct Header: Codable {
    let resultCode, resultMsg: String
}

class ViewController: UIViewController {

  
   

    var forecastData : Welcome? //Label에서 사용하기 위해서. 초기값 없으니 옵셔널형
    // 1. URL 생성
//     let apiUrl = URL(string : "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst?serviceKey=ZHlUIADlBGkgJmKcx8NxG5rHYPg5a15MWtAvnqtjOiqe%2B051mlP9Te%2Fwkc9sHC%2FXkYhmkpu72NNzcpw61lKK5Q%3D%3D&numOfRows=10&pageNo=1&dataType=JSON&base_date=20240509&base_time=2200&nx=55&ny=127")
    
    
    let mainView = UIView()
    let mainLabel = UILabel()
    let forecastDataLabel = UILabel()
    let forecastDataLabel2 = UILabel()
    let forecastDataLabel3 = UILabel()
    let forecastDataLabel4 = UILabel()
    let refreshButton = UIButton()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        getData()
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
        
        view.addSubview(forecastDataLabel2)
        forecastDataLabel2.translatesAutoresizingMaskIntoConstraints = false
        forecastDataLabel2.centerXAnchor.constraint(equalTo: forecastDataLabel.centerXAnchor) .isActive = true
        forecastDataLabel2.centerYAnchor.constraint(equalTo: forecastDataLabel.centerYAnchor, constant: 30) .isActive = true
        //forecastDataLabel.text = forecastData?.response.body.items.item[1].obsrValue
        forecastDataLabel2.textAlignment = .center
        
        view.addSubview(forecastDataLabel3)
        forecastDataLabel3.translatesAutoresizingMaskIntoConstraints = false
        forecastDataLabel3.centerXAnchor.constraint(equalTo: forecastDataLabel2.centerXAnchor) .isActive = true
        forecastDataLabel3.centerYAnchor.constraint(equalTo: forecastDataLabel2.centerYAnchor, constant: 30) .isActive = true
        //forecastDataLabel.text = forecastData?.response.body.items.item[1].obsrValue
        forecastDataLabel3.textAlignment = .center
        
        view.addSubview(forecastDataLabel4)
        forecastDataLabel4.translatesAutoresizingMaskIntoConstraints = false
        forecastDataLabel4.centerXAnchor.constraint(equalTo: forecastDataLabel3.centerXAnchor) .isActive = true
        forecastDataLabel4.centerYAnchor.constraint(equalTo: forecastDataLabel3.centerYAnchor, constant: 30) .isActive = true
        //forecastDataLabel.text = forecastData?.response.body.items.item[1].obsrValue
        forecastDataLabel4.textAlignment = .center
        
        view.addSubview(refreshButton)
        refreshButton.translatesAutoresizingMaskIntoConstraints = false
        refreshButton.centerXAnchor.constraint(equalTo: forecastDataLabel4.centerXAnchor) .isActive = true
        refreshButton.centerYAnchor.constraint(equalTo: forecastDataLabel4.centerYAnchor, constant: 40) .isActive = true
        //forecastDataLabel.text = forecastData?.response.body.items.item[1].obsrValue
        refreshButton.setTitle("새로고침", for: .normal)
        refreshButton.backgroundColor = .systemBlue
        refreshButton.layer.cornerRadius = 9
        refreshButton.addTarget(self, action: #selector(refreshTapped), for: .touchUpInside)
    }
    @objc func refreshTapped(){
            getData()
    }
    
  
    
        func getData(){
          
                if let apiUrl = URL(string:"http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst?serviceKey=나의apiKey입력&numOfRows=10&pageNo=1&dataType=JSON&base_date=20240509&base_time=2300&nx=55&ny=127"){
                    // 2. URLSession 인스턴스 생성
                    let session = URLSession(configuration: .default)
                    let task = session.dataTask(with: apiUrl) { data, response, error in
                        if error != nil {
                            print(error!)
                            return
                        }
                        if let JSONdata = data{
                            //print(JSONdata) //받아온 바이트 수 출력 (905 byte)
                            //let dataString = String(data: JSONdata, encoding: .utf8)
                            //print(dataString!)//데이터 스트링으로 찍어보기
                            let decoder = JSONDecoder()
                            do{//JSON객체 Welcome형으로 디코딩
                                let decodeData = try decoder.decode(Welcome.self, from: JSONdata)//사용하려면 반드시 에러핸들링 해줘야함
                                // print(decodeData.response.body.items.item[0].baseDate)
                                self.forecastData = decodeData
                                print(self.forecastData!)
                                DispatchQueue.main.sync {
                                    self.forecastDataLabel.text = "날짜 : " + (self.forecastData?.response.body.items.item[0].baseDate)!
                                    self.forecastDataLabel2.text = "시간 : " + (self.forecastData?.response.body.items.item[0].baseTime)!
                                    self.forecastDataLabel3.text = "날씨구분코드 : " + (self.forecastData?.response.body.items.item[0].category)!
                                    self.forecastDataLabel4.text = "날씨값 : " + (self.forecastData?.response.body.items.item[0].obsrValue)!
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

