import Foundation

struct IteoHeaders {
    struct ContentType {
        static let name = "Content-Type"
        static let value = "application/json"
    }
    struct Accept {
        static let name = "Accept"
        static let value = "application/json"
    }
    struct ApiKey {
        static let name = "x-apikey"
        static let value = "5bb889c2bd79880aab0a79f5"
    }
}

extension IteoHeaders {
    static func getAllHeaders() -> [String: String] {
        var headers: [String: String] = [:]
        headers[IteoHeaders.ContentType.name] = IteoHeaders.ContentType.value
        headers[IteoHeaders.Accept.name] = IteoHeaders.Accept.value
        headers[IteoHeaders.ApiKey.name] = IteoHeaders.ApiKey.value
        return headers
    }
}
