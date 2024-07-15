//
//  TopButtonView.swift
//  week7
//
//  Created by 이상엽 on 5/21/24.
//

import SwiftUI

struct TopButtonView: View {
    let items = ["전체", "알바", "부동산", "중고차", "먹거리", "생활", "동네이야기"]
    @State private var searchText: String = ""
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(items, id: \.self) { item in
                    Text(item)
                        .padding()
                        .background(Color(hue: 1.0, saturation: 0.033, brightness: 0.748))
                        .foregroundColor(.white)
                        .frame(height: UIScreen.main.bounds.height / 22)
                        .cornerRadius(6)
                }
            }
            .padding()
        }.background(Color.white)
         .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 21)
        
    }
}
#Preview {
    TopButtonView()
}
