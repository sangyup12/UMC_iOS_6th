import SwiftUI

struct BottomToolBar: View {
    @State private var navigateToSecondView = false
    @ObservedObject var selectedSizeModel: SelectedSizeModel

    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.bottom) // 하단 전체를 흰색 배경으로 설정
            VStack {
                Spacer()
                Divider()
                HStack {
                    VStack {
                        Text("배달최소주문금액")
                            .foregroundColor(Color.gray)
                            .font(.system(size: 13))
                        Text("17,000원")
                    }
                    .padding(.trailing, 30)
                    
                    Spacer()

                    Button(action: {
                        navigateToSecondView = true
                    }) {
                        Text("장바구니")
                            .padding([.leading, .trailing], 40)
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color(red: 0.37, green: 0.746, blue: 0.733))
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
        }
        .navigationDestination(isPresented: $navigateToSecondView) {
            SecondView(selectedButtons: $selectedSizeModel.selectedButtons)
        }
    }
}

struct BottomToolBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomToolBar(selectedSizeModel: SelectedSizeModel())
    }
}
