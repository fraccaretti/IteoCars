import Foundation

protocol ReachabilityObserver {
    func reachabilityStatusChanged(status: ReachabilityStatus)
}
