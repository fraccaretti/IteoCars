import Foundation
import Alamofire

struct Request {
    let data: Data?
    let url: URLConvertible
    let method: HTTPMethod
    let parameters: Parameters?
    let headers: HTTPHeaders?
    
    init(data: Data?,
         url: URLConvertible,
         method: HTTPMethod,
         parameters: Parameters?,
         headers: HTTPHeaders?) {
        self.data = data
        self.url = url
        self.method = method
        self.parameters = parameters
        self.headers = headers
    }
}
