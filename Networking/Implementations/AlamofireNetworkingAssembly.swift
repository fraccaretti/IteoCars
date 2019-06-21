import Foundation
import Swinject
import Alamofire

class AlamofireNetworkingAssembly: Assembly {
    private let timeoutIntervalForRequestInSeconds: TimeInterval = 15
    private let reachabilityHostAddress: String = "www.google.com"
    
    func assemble(container: Container) {
        container.register(URLSessionConfiguration.self) { _ in
            let config = URLSessionConfiguration()
            config.timeoutIntervalForRequest = self.timeoutIntervalForRequestInSeconds
            return config
        }
        container.register(SessionManager.self) { resolver -> SessionManager in
            return SessionManager(configuration: resolver.resolve(URLSessionConfiguration.self)!)
        }
        container.register(NetworkReachabilityManager.self) { _ in
            return NetworkReachabilityManager(host: self.reachabilityHostAddress)!
        }
        container.register(AlamofireReachabilityStatusMapper.self, factory: { _ in
            return AlamofireReachabilityStatusMapper()
        })
        container.register(Reachability.self, factory: { resolver -> Reachability in
            return AlamofireReachability(reachabilityManager: resolver.resolve(NetworkReachabilityManager.self)!,
                                         mapper: resolver.resolve(AlamofireReachabilityStatusMapper.self)!)
        })
        container.register(Networking.self) { resolver -> Networking in
            return AlamofireNetworking(sessionManager: resolver.resolve(SessionManager.self)!)
        }
    }
}
