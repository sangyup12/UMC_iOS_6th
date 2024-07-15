//
//  ViewController.swift
//  week4
//
//  Created by 이상엽 on 4/30/24.
//

import UIKit

class ViewController: UIViewController {

    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let loginButton = UIButton()
    let signUpButton = UIButton()
    let loginStatusLabel: UILabel = {
            let label = UILabel()
            label.text = "Welcome"
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = UIColor.black
            label.font = UIFont.boldSystemFont(ofSize: 50) // 볼드체 시스템 폰트, 사이즈는 20
//            label.backgroundColor = .red
            label.numberOfLines = 0
        

            return label
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        if let bundleID = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundleID)
        }

        view.addSubview(loginStatusLabel)
               NSLayoutConstraint.activate([
                   loginStatusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                   loginStatusLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -200),
                   loginStatusLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                   loginStatusLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
               ])
        setupUI()
        
    }
    func setupUI() {
        // 화면 배치와 기본 설정
        self.view.addSubview(emailTextField)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60).isActive = true // 이메일 필드를 중앙에서 조금 위로 올립니다.
        emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        emailTextField.placeholder = "이메일을 입력하세요"
        emailTextField.borderStyle = .roundedRect

        // passwordTextField 오토레이아웃 설정
        view.addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20).isActive = true // 이메일 필드 아래로 20 포인트 떨어진 위치
        passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        passwordTextField.placeholder = "비밀번호를 입력하세요"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true

        // loginButton 오토레이아웃 설정
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginButton.setTitle("로그인", for: .normal)
        loginButton.layer.cornerRadius = 9
        loginButton.backgroundColor = .systemBlue
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        // signUpButton 오토레이아웃 설정
        view.addSubview(signUpButton)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20).isActive = true
        signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        signUpButton.setTitle("회원가입", for: .normal)
        signUpButton.layer.cornerRadius = 9
        signUpButton.backgroundColor = .systemGray4
        signUpButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        // 로그인, 회원가입 버튼 액션 설정
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        
    }


    @objc func loginButtonTapped() {
            // 여기서 로그인 로직을 구현합니다.
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        let savedPassword = UserDefaults.standard.string(forKey: email)
                
        // 저장된 비밀번호가 존재하지 않는 경우
            if savedPassword == nil {
                loginStatusLabel.text = "존재하지 않는 ID"
            } else if savedPassword != password {
                // 비밀번호가 일치하지 않는 경우
                loginStatusLabel.text = "비밀번호 불일치"
            } else {
                // 로그인 성공
                updateLoginStatus(success: true)
            }
        }
    
    @objc func signUpButtonTapped() {
            guard let email = emailTextField.text, let password = passwordTextField.text else { return }
            if UserDefaults.standard.object(forKey: email) != nil {
                updateSingUpStatus(success: false)
            } else {
                UserDefaults.standard.set(password, forKey: email)
                updateSingUpStatus(success: true)
            }
        }

    // 로그인 상태 라벨을 업데이트하는 메서드
    func updateLoginStatus(success: Bool) {
        if success {
            loginStatusLabel.text = "로그인 성공"
        } else {
            loginStatusLabel.text = "로그인 실패"
        }
    }
    // 회원가입 상태 라벨을 업데이트하는 메서드
    func updateSingUpStatus(success: Bool) {
        if success {
            loginStatusLabel.text = "회원가입 성공"
        } else {
            loginStatusLabel.text = "이미 존재하는 아이디입니다."
        }
    }
}

