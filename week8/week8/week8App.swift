import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView(selectedSizeModel: SelectedSizeModel())
            }
        }
    }
}
