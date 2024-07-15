import SwiftUI

struct FirstView: View {
    @State private var selectedButtons: [String] = []
    @State private var navigateToSecondView = false

    let buttons = ["M", "L", "치즈 크러스트"]

    func toggleSelection(button: String) {
        if let index = selectedButtons.firstIndex(of: button) {
            selectedButtons.remove(at: index)
        } else {
            selectedButtons.append(button)
        }
    }

    var body: some View {
        NavigationStack {
            VStack {
                ForEach(buttons, id: \.self) { button in
                    Button(action: {
                        toggleSelection(button: button)
                    }) {
                        Text(button)
                            .foregroundColor(selectedButtons.contains(button) ? .blue : .black)
                    }
                }
                Button("Next") {
                    navigateToSecondView = true
                }
            }
            .navigationDestination(isPresented: $navigateToSecondView) {
                SecondView(selectedButtons: $selectedButtons)
            }
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
