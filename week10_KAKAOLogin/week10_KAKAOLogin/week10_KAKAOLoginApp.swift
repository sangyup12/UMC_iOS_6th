//
//  week10_KAKAOLoginApp.swift
//  week10_KAKAOLogin
//
//  Created by 이상엽 on 6/19/24.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct week10_KAKAOLoginApp: App {
    
    @UIApplicationDelegateAdaptor var appDelegate : MyAppDelegate
    
    
//    init() {
//        let kakaoAppKey = Bundle.main.infoDictionary?["KAKAO_NATIVE_APP_KEY"] ?? ""
//        
//           // Kakao SDK 초기화
//           KakaoSDK.initSDK(appKey: kakaoAppKey as! String)
//       }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
