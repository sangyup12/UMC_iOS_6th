//
//  FixedButtonView.swift
//  week7
//
//  Created by 이상엽 on 5/21/24.
//

import SwiftUI

struct FixedButtonView : View{
    var body: some View{
        // 고정된 버튼
        Button(action: {
            print("Button tapped")
        }) {
            Text("+  ")
                .font(.system(size: 30)) // 폰트 크기
                .fontWeight(.bold)
                .padding()
                .background(Color(red: 0.996, green: 0.435, blue: 0.059))
                .foregroundColor(.white)
                .cornerRadius(40)
                .padding(.bottom, 20) // 하단 여백 추가
                .padding(.trailing, 20) // 오른쪽 여백
        }
    }
}
