import Foundation

struct IteoCarsServiceEndpoints {
    private let baseURL: String = "https://iteotes-bb88.restdb.io/rest"
    private let carsEndpoint: String = "/cars"
}

extension IteoCarsServiceEndpoints {
    func getCarsEndpoint() -> String {
        return baseURL + carsEndpoint
    }
}
