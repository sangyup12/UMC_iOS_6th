//
//  ViewController.swift
//  week5_kakao
//
//  Created by 이상엽 on 5/10/24.
//

import UIKit
import KakaoSDKAuth

class ViewController: UIViewController {

    let loginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
    }
    func setUI(){
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor) .isActive = true
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100) .isActive = true
        loginButton.setImage(UIImage(named: "kakao_login_large_wide"), for: .normal)
        loginButton.addTarget(self, action: #selector(login()), for: .touchUpInside)
    }
    @objc func login(){
        AuthApi.shared.loginWithKakaoTalk {(oauthToken, error) in
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

