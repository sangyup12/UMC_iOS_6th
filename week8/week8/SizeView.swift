import SwiftUI

struct SizeView: View {
    @ObservedObject var selectedSizeModel: SelectedSizeModel

    let buttons = ["M", "L", "치즈 크러스트"]

    func toggleSelection(button: String) {
        if let index = selectedSizeModel.selectedButtons.firstIndex(of: button) {
            selectedSizeModel.selectedButtons.remove(at: index)
        } else {
            selectedSizeModel.selectedButtons.append(button)
        }
    }

    var body: some View {
        VStack {
            HStack {
                Text("가격")
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                    .padding()
                Spacer()
                Text("필수")
                    .padding(5)
                    .background(Color(red: 0.821, green: 0.876, blue: 0.999))
                    .foregroundColor(.blue)
                    .cornerRadius(18)
                    .padding(.trailing,10)
            }

            HStack{
                VStack {
                    ForEach(buttons, id: \.self) { button in
                        Button(action: {
                            toggleSelection(button: button)
                        }) {
                            Text(button)
                                .foregroundColor(selectedSizeModel.selectedButtons.contains(button) ? .blue : .black)
                                .padding()
                                .background(selectedSizeModel.selectedButtons.contains(button) ? Color.blue.opacity(0.2) : Color.clear)
                                .cornerRadius(8)
                        }
                    }
                }//VStack
                Spacer()
                VStack{
                    Text("20,000원")
                        .padding()
                    Text("26,000원")
                        .padding()
                    Text("3,000원")
                        .padding()
                }
            }//HStack
        }
        .background(Color.white)
    }
}

struct SizeView_Previews: PreviewProvider {
    static var previews: some View {
        SizeView(selectedSizeModel: SelectedSizeModel())
    }
}
