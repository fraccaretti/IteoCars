import Foundation

protocol Reachability {
    var observers: [ReachabilityObserver] { get }
    
    func addObserver(_ observer: ReachabilityObserver)
    func notifyObservers(withStatus: ReachabilityStatus)
}
