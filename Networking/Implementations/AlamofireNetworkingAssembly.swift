import Foundation
import Swinject
import Alamofire

class AlamofireNetworkingAssembly: Assembly {
    func assemble(container: Container) {
        container.register(SessionManager.self) { _ in
            return SessionManager(configuration: .default)
        }
        container.register(NetworkReachabilityManager.self) { _ in
            return NetworkReachabilityManager(host: "www.google.com")!
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
