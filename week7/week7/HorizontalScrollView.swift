//
//  HorizontalScrollView.swift
//  week7
//
//  Created by 이상엽 on 5/21/24.
//

import SwiftUI

struct HorizontalScrollView: View {
    let items: [Item] = [
            Item(id: 1, name: "수동 팥빙수 얼음 가는 기계", imageName: "selfbingsu", price: "5,000원", spotAndTime: ""),
            Item(id: 2, name: "얼음틀", imageName: "icemodule", price: "3,000원", spotAndTime: ""),
            Item(id: 3, name: "스탠리 텀블러", imageName: "stanley", price: "35,000원", spotAndTime: ""),
            Item(id: 4, name: "얼음 냉동고", imageName: "refriger", price: "250,000원", spotAndTime: ""),
            Item(id: 5, name: "아이스팩 80여개", imageName: "icepack", price: "나눔🧡", spotAndTime: ""),
            Item(id: 6, name: "냉면기계", imageName: "nang", price: "1,500,000원", spotAndTime: ""),
        ]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(items, id: \.id) { item in
                                VStack {
                                    Image(item.imageName) // 이미지
                                        .resizable()
                                        .foregroundColor(.yellow)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 120, height: 120)
                                        .cornerRadius(15)
                                    
                                    Text(item.name)
                                        .font(.system(size: 20))
                                        .lineLimit(2) // 최대 2줄까지만 표시
                                        .frame(maxWidth: 120, alignment: .leading)
                                    Text(item.price)
                                        .font(.system(size: 20))
                                        .fontWeight(.bold)
                                        .frame(maxWidth: 120, alignment: .leading)
                                    Spacer()
                                }//VStack
                            }//ForEach
            }//HStack
            .padding()
            Divider()
        }
    }
}


