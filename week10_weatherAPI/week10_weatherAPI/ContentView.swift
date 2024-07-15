import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = WeatherViewModel()
    @State private var city: String = "Seoul"

    var body: some View {
        VStack {
            TextField("도시 이름을 입력하세요", text: $city, onCommit: {
                viewModel.fetchWeather(for: city)
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()

            if let weather = viewModel.weather {
                Text("\(weather.name)의 날씨")
                    .font(.title)
                    .padding()

                Text("온도: \(weather.main.temp, specifier: "%.1f")°C")
                    .padding()

                Text("설명: \(weather.weather.first?.description ?? "N/A")")
                    .padding()

                if let iconURL = weather.weather.first?.iconURL() {
                    AsyncImage(url: iconURL) { image in
                        image.resizable()
                             .aspectRatio(contentMode: .fit)
                             .frame(width: 100, height: 100)
                    } placeholder: {
                        ProgressView()
                    }
                }
            } else {
                Text("날씨 정보를 가져오는 중...")
                    .padding()
            }
        }
        .onAppear {
            viewModel.fetchWeather(for: city)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
