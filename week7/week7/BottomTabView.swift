//
//  BottomTabView.swift
//  week7
//
//  Created by 이상엽 on 5/21/24.
//

import SwiftUI

struct BottomTabView: View {
    var body: some View {
        HStack(spacing: 10) {
            tabButton(imageName: "house", label: "홈")
            tabButton(imageName: "doc.text", label: "동네생활")
            tabButton(imageName: "location.circle", label: "내 근처")
            tabButton(imageName: "bubble.left.and.bubble.right", label: "채팅")
            tabButton(imageName: "person", label: "나의 당근")
        }
        .background(Color.white)
        .cornerRadius(15, corners: [.topLeft, .topRight])
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 12)
        .overlay(
                            Rectangle()
                                .frame(height: 0.5) // 높이를 1로 설정하여 얇은 선을 만듦
                                .foregroundColor(.gray) // 선의 색상 설정
                                .offset(y: -8), // 상단에 위치하도록 오프셋 조정
                            alignment: .top
                        )
    }
}

struct tabButton: View {
    var imageName: String
    var label: String
    
    var body: some View {
        Button(action: {}){
            VStack(spacing: 5) {
                Image(systemName: imageName)
                    .resizable()
                    .foregroundColor(.black)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                
                
                Text(label)
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.bottom, 5)
            }
        }
    }
}



// Extension for corner radius
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
