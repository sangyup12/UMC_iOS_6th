//
//  TopMenuSecondView.swift
//  week8
//
//  Created by 이상엽 on 5/31/24.
//

import SwiftUI

struct TopMenuSecondView: View {
    var body: some View {
        VStack {
            HStack(spacing:20){
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("배달/포장 1")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("배민스토어")
                        .foregroundColor(Color.gray)
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("대용량특가")
                        .foregroundColor(Color.gray)
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("전국별미")
                        .foregroundColor(Color.gray)
                })
            }
            Divider()
            HStack(spacing:2){
                Text("배달")
                    .fontWeight(.bold)
                    .font(.system(size: 27))
                Button(action: {
                }){
                    Image(systemName: "chevron.down")
                        .foregroundColor(.black)
                }
                Text("로 받을게요")
                Spacer()
            }
            Rectangle()
                .frame(width: UIScreen.main.bounds.width,height: 10)
                .foregroundColor(Color(red: 0.925, green: 0.925, blue: 0.925))

        }.background(.white)//VStack
    }
}
struct TopMenuSecondView_Previews: PreviewProvider {
    static var previews: some View {
        TopMenuSecondView()
    }
}
