//
//  ViewController.swift
//  week5_kakaoSDKforSPM
//
//  Created by 이상엽 on 5/10/24.
//

import UIKit
import KakaoSDKUser

class ViewController: UIViewController {
    
    let loginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        
        // Do any additional setup after loading the view.
    }

    func setUI(){
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor) .isActive = true
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200) .isActive = true
        loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40) .isActive = true
        loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40) .isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 80) .isActive = true
        loginButton.setImage(UIImage(named:"kakao_login_large_narrow"), for: .normal)
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        
    }
    @objc func login(){
        UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
              if let error = error {
                  print(error)
              }
              else {
                  print("loginWithKakaoAccount() success.")

                  //do something
                   _ = oauthToken
              }
          }
    }

}

