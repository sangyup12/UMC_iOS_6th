//
//  ContentView.swift
//  week10_KAKAOLogin
//
//  Created by 이상엽 on 6/19/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var kakaoAuthVM: KakaoAuthVM = KakaoAuthVM()
    
    let loginStatusInfo : (Bool) -> String = { isLoggedIn in
        return isLoggedIn ? "로그인 상태" : "로그아웃 상태 "
        
    }
    
    var body: some View {
        VStack(spacing:20) {
            Text(loginStatusInfo(kakaoAuthVM.isLoggedIn))
            
            Button("카카오 로그인",action: {
                kakaoAuthVM.handleKakaoLogin()
            })
            
            Button("카카오 로그아웃",action: {
                kakaoAuthVM.kakaoLogout()
            })
        }
    }
}

#Preview {
    ContentView()
}
