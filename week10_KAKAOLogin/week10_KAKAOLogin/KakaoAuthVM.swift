//
//  KakaoAuthVM.swift
//  week10_KAKAOLogin
//
//  Created by 이상엽 on 6/21/24.
//

import Foundation
import Combine
import KakaoSDKAuth
import KakaoSDKUser

class KakaoAuthVM : ObservableObject{
    
    @Published var isLoggedIn : Bool = false
    
    @MainActor
    func kakaoLogout(){
        Task {
            if await handleKakaoLogout(){
                isLoggedIn = false
            }
        }
    }
    
    func handleKakaoLogout() async -> Bool{
        
        await withCheckedContinuation{ continueation in
            UserApi.shared.logout {(error) in
                if let error = error {
                    print(error)
                    continueation.resume(returning: false)
                }
                else {
                    print("logout() success.")
                    continueation.resume(returning: true)
                }
            }
        }
    }
    
    func handleLoginWithKakaoTalkApp() async -> Bool {
        
        await withCheckedContinuation{continueation in
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                    continueation.resume(returning: false)
                }
                else {
                    print("loginWithKakaoTalk() success.")

                    //do something
                    _ = oauthToken
                    continueation.resume(returning: true)
                }
            }
        }
    }
    
    func handleLoginWithKakaoAccount() async -> Bool{
        await withCheckedContinuation{continueation in
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                    if let error = error {
                        print(error)
                        continueation.resume(returning: false)
                    }
                    else {
                        print("loginWithKakaoAccount() success.")

                        //do something
                        _ = oauthToken
                        continueation.resume(returning: true)
                    }
                }
            
        }
    }
    
    @MainActor
    func handleKakaoLogin(){
        Task{
            // 카카오톡 실행 가능 여부 확인 - 설치 되어있을 때
            if (UserApi.isKakaoTalkLoginAvailable()) {
                
               //카카오톡 앱을 통해 로그인
                isLoggedIn = await handleLoginWithKakaoTalkApp()
                
            } else{// 설치 안 되어 있을 때
                //카카오 웹뷰로 로그인
                isLoggedIn = await handleLoginWithKakaoAccount()
            }
        }
    }
}
