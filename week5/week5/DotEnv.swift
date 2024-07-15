import Foundation

class DotEnv {
    static let shared = DotEnv()
    private var values: [String: String] = [:]

    init() {
        load()
    }

    private func load() {
        guard let path = Bundle.main.path(forResource: ".env", ofType: nil),
              let contents = try? String(contentsOfFile: path) else { return }
        contents.split(separator: "\n").forEach { line in
            let keyValuePair = line.split(separator: "=", maxSplits: 1)
            if keyValuePair.count == 2 {
                let key = String(keyValuePair[0])
                let value = String(keyValuePair[1])
                values[key] = value
            }
        }
    }

    func value(forKey key: String) -> String? {
        return values[key]
    }
}
