//
//  TopView.swift
//  week7
//
//  Created by 이상엽 on 5/21/24.
//

import SwiftUI

struct TopView: View {
    var body: some View {
        HStack{
                    Button(action: {
                        // Action for address button
                    }) {
                        HStack {
                            Text("우리나라  ")
                                .font(.system(size: 20)) // 폰트 크기
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            Image(systemName: "chevron.down")
                                .imageScale(.small)
                                .foregroundColor(.black)
                        }
                    }
                    Spacer()
                    HStack(spacing: 7) {
                        Button(action: {
                            // Action for menu button
                        }) {
                            Image(systemName: "text.justify")
                                .foregroundColor(.black)
                                .frame(width: 30, height: 30)
                        }
                        Button(action: {
                            // Action for bell button
                        }) {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.black)
                                .frame(width: 30, height: 30)
                        }
                        Button(action: {
                            // Action for cart button
                        }) {
                            Image(systemName: "bell")
                                .foregroundColor(.black)
                                .frame(width: 30, height: 30)
                        }
                    }
                }
                
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 18)
                .background(Color.white)
                .overlay(
                                    Rectangle()
                                        .frame(height: 0.5) // 높이를 1로 설정하여 얇은 선을 만듦
                                        .foregroundColor(.gray) // 선의 색상 설정
                                        .offset(y: 0.5), // 상단에 위치하도록 오프셋 조정
                                    alignment: .bottom
                                )
            }
    }

