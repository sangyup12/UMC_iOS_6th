//
//  firstProductView.swift
//  week7
//
//  Created by 이상엽 on 5/21/24.
//

import SwiftUI

struct Item {
    var id: Int
    var name: String
    var imageName: String
    var price : String
    var spotAndTime : String
}
struct firstProductView : View{
    let items: [Item] = [
            Item(id: 1, name: "전기자전거", imageName: "elecbi", price: "50,000원", spotAndTime: "별내동·38분 전"),
            Item(id: 2, name: "농약 분무기", imageName: "nongyak", price: "150,000원", spotAndTime: "부산 수영구 광안제1동·1달 전"),
            Item(id: 3, name: "LG티비 55인치", imageName: "LGTV", price: "100,000원", spotAndTime: "전남 광양시 광양읍·3일 전"),
        ]
    var body: some View {
        ForEach(items, id: \.id) { item in
                        HStack {
                            Image(item.imageName) // 이미지
                                .resizable()
                                .foregroundColor(.yellow)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 120, height: 120)
                                .cornerRadius(15)
                            VStack(alignment: .leading){
                                Text(item.name)
                                    .font(.system(size: 22)) // 폰트 크기
                                Text(item.spotAndTime)
                                    .font(.system(size: 14)) // 폰트 크기
                                    .fontWeight(.bold)
                                    .foregroundColor(.gray)
                                Text(item.price)
                                    .font(.system(size: 22)) // 폰트 크기
                                    .fontWeight(.bold)
                                Spacer()
                            }
                            
                            Spacer()
                            VStack{
                                Button(action: {
                                    print("\(item) 선택됨")
                                }) {
                                    Image(systemName: "ellipsis")
                                        .foregroundColor(.gray)
                                }
                                
                                Spacer()
                                
                                HStack{
                                    Button(action: {
                                        print("\(item) 선택됨")
                                    }) {
                                        Image(systemName: "bubble.left.and.bubble.right")
                                            .foregroundColor(.gray)
                                    }
                                    Button(action: {
                                        print("\(item) 선택됨")
                                    }) {
                                        Image(systemName: "heart")
                                            .foregroundColor(.gray)
                                    }
                                }
                               
                            }
                           
                          
                        }//HStack
                        .padding()
            Divider() // 각 항목 사이에 구분선을 추가
                    }//ForEach
    }
}
