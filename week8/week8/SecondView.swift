import SwiftUI

struct SecondView: View {
    @Binding var selectedButtons: [String]

    var body: some View {
        VStack {
            TopMenuSecondView()
            HStack{
                Image("dominos")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 0.5) // 테두리 색상 및 두께 설정
                                        )
                Text("도미노피자 갈매점")
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                Spacer()
                Image(systemName: "clock")
                Text("40~50분 후 도착")
            }.padding([.top,.bottom],10)
            Divider()
            HStack{
                Text("와일드 와일드 웨스트 스테이크")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                Spacer()
                Image(systemName: "xmark")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20,height: 20)
            }
            HStack(alignment: .top){
                Image("dominos")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 0.5) // 테두리 색상 및 두께 설정
                                        )
                ForEach(selectedButtons, id: \.self) { button in
                    Text(button)
                        .foregroundColor(.gray)
                }
                Spacer()
            }//Hstack
            HStack{
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("옵션변경")
                        .foregroundColor(.black)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 0.5) // 테두리 색상 및 두께 설정
                        )
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("-    1    +")
                        .foregroundColor(.black)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 0.5) // 테두리 색상 및 두께 설정
                        )
                })
            }//Hstack
            Divider()
            Spacer()
            SecondBottomToolBar()
        }//VStack
        
        
        .padding()
        .toolbar {
            ToolbarItem(placement: .principal) {
                                Text("장바구니") // 타이틀 텍스트
                                    .font(.headline)
                            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    // 액션 코드
                }) {
                    Image(systemName: "house")
                        .foregroundColor(.black)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    // 액션 코드
                }) {
                    Image(systemName: "person.3.sequence")
                }
            }
        }//toolbar
    }
}




struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView(selectedButtons: .constant(["Button 1", "Button 2"]))
    }
}
