import Foundation
import Alamofire

class AlamofireNetworking: Networking {
    
    private let sessionManager: SessionManager
    
    init(sessionManager: SessionManager) {
        self.sessionManager = sessionManager
    }
    
    func performDataRequest(_ request: Request,
                                        completion: ((Data) -> Void)?,
                                        onError: @escaping (Error) -> Void) {
        sessionManager.request(request.url,
                               method: request.method,
                               parameters: request.parameters,
                               encoding: JSONEncoding.default,
                               headers: request.headers)
            .response { dataResponse in
                if let response = dataResponse.response {
                    switch response.statusCode {
                    case 200..<300:
                        if let data = dataResponse.data {
                            completion?(data)
                        }
                    default:
                        guard let error = dataResponse.error else {
                            onError(NetworkingError.dataRequestFailedWithCode(code: response.statusCode))
                            return
                        }
                        onError(error)
                    }
                }
            }
    }

    func uploadData(_ request: Request, completion: @escaping () -> Void, onError: @escaping (Error) -> Void) {
        guard let data = request.data else {
            onError(NetworkingError.uploadDataIsNil)
            return
        }
        sessionManager.upload(data, to: request.url, method: request.method, headers: request.headers).response { dataResponse in
            if let response = dataResponse.response {
                switch response.statusCode {
                case 200..<300: completion()
                default:
                    guard let error = dataResponse.error else { return }
                    onError(error)
                }
            }
        }
    }
}
