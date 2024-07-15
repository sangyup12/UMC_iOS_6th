import SwiftUI

struct SecondBottomToolBar: View {
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.bottom) // 하단 전체를 흰색 배경으로 설정
            VStack {
                Spacer()
                Divider()
                HStack {
                    

                    Button(action: {
                    }) {
                        Text("배달 주문하기")
                            .padding([.leading, .trailing], 100)
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color(red: 0.37, green: 0.746, blue: 0.733))
                            .cornerRadius(10)
                    }
                }
            }
        }
        
    }
}

struct SecondBottomToolBar_Previews: PreviewProvider {
    static var previews: some View {
        SecondBottomToolBar()
    }
}
