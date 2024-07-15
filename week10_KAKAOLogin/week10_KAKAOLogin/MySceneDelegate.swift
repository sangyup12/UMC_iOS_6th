//
//  MySceneDelegate.swift
//  week10_KAKAOLogin
//
//  Created by 이상엽 on 6/20/24.
//

import Foundation
import KakaoSDKAuth
import UIKit


class MySceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        if let url = URLContexts.first?.url {
            if (AuthApi.isKakaoTalkLoginUrl(url)) {
                _ = AuthController.handleOpenUrl(url: url)
            }
        }
    }
    
}
