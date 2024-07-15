//
//  HorizontalTextButtonView.swift
//  week7
//
//  Created by 이상엽 on 5/21/24.
//

import SwiftUI

struct HorizontalTextButtonView : View{
    var body: some View{
        HStack{
            Text("시원한 여름 간식의 계절🍉🍧🍦")
                .font(.system(size: 22)) // 폰트 크기
                .fontWeight(.bold)
            Spacer()
            Image(systemName: "chevron.right")
        }.padding()
        
        
    }
}
