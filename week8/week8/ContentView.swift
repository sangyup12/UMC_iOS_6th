import SwiftUI
import Combine



struct ContentView: View {
    @ObservedObject var selectedSizeModel: SelectedSizeModel

    var body: some View {
        NavigationStack {
            VStack {
                // Placeholder for a detailed view
                MenuDetailView()
                    .padding()
                SizeView(selectedSizeModel: selectedSizeModel)
                BottomToolBar(selectedSizeModel: selectedSizeModel)
            }
            .background(Color(red: 0.925, green: 0.925, blue: 0.925))
        }
    }
}

struct DetailView: View {
    var body: some View {
        Text("Detail View")
            .navigationTitle("Detail")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(selectedSizeModel: SelectedSizeModel())
    }
}
