import Foundation
import Alamofire

class AlamofireReachability: Reachability {
    private let reachabilityManager: NetworkReachabilityManager
    private let mapper: AlamofireReachabilityStatusMapper
    
    var observers: [ReachabilityObserver] = []
    
    init(reachabilityManager: NetworkReachabilityManager,
         mapper: AlamofireReachabilityStatusMapper) {
        self.reachabilityManager = reachabilityManager
        self.mapper = mapper
        listenForReachabilityChanges()
    }
    
    func addObserver(_ observer: ReachabilityObserver) {
        observers.append(observer)
    }
    
    func notifyObservers(withStatus status: ReachabilityStatus) {
        for observer in observers {
            observer.reachabilityStatusChanged(status: status)
        }
    }
    
    private func listenForReachabilityChanges() {
        reachabilityManager.listener = { status in
            self.reachabilityStatusChanged(status)
        }
    }
    
    private func reachabilityStatusChanged(_ status: NetworkReachabilityManager.NetworkReachabilityStatus) {
        let domainStatus = mapper.map(alamofireReachabilityStatus: status)
        notifyObservers(withStatus: domainStatus)
    }
}
