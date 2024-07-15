//
//  secondProductView.swift
//  week7
//
//  Created by 이상엽 on 5/21/24.
//

import SwiftUI

struct secondProductView : View{
    let items: [Item] = [
            Item(id: 1, name: "테이블 의자 세트", imageName: "tableSet", price: "50,000원", spotAndTime: "별내동·38분 전"),
            Item(id: 2, name: "미사용 프라이팬 새제품", imageName: "frypan", price: "7,000원", spotAndTime: "서울 광진구 중곡동·1분 전"),
            Item(id: 3, name: "디올 북도트 스몰", imageName: "dior", price: "500,000원", spotAndTime: "서울 강남구 신사동·12분 전"),
            Item(id: 4, name: "신발 팔아요", imageName: "shoes", price: "1원", spotAndTime: "서울 성동구·5일 전"),
            Item(id: 5, name: "안 쓰는 일렉기타 팝니다", imageName: "elecguitar", price: "20,000원", spotAndTime: "서울 양천구 목4동·1일 전"),
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
