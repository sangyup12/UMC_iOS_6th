//
//  MenuDetailView.swift
//  week8
//
//  Created by 이상엽 on 5/30/24.
//

import SwiftUI

struct MenuDetailView: View {
    var body: some View {
        VStack(alignment: .leading){
            Image("dominos")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width, height: 300)
            HStack(spacing: 0){
                Image("bestMenu")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                Text("와일드 와일드 웨스트 스테이크")
                    .fontWeight(.bold)
                    .font(.system(size: 25))
                Spacer()
            }.padding(.leading,15)
            Text("카우보이 버터 치즈 소스로 완성된 미국 서부 정통 스테이크의 풍미를 담은 피자")
                .foregroundColor(.gray)
                .lineLimit(2)
                .font(.system(size: 18))
                .padding(.leading,20)
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("영양성분 및 알레르기성분 표시보기")
                    .foregroundColor(.black)
                    .font(.system(size: 12))
                    .padding([.leading,.trailing],20)
                    .padding([.top,.bottom],5)
                    .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.927))
                    .cornerRadius(28)
            }).padding([.leading,.bottom],20)
        }.background(.white)//VStack
            
            
    }
}

struct MenuDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MenuDetailView()
    }
}
