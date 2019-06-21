import Foundation
import Alamofire

class AlamofireReachabilityStatusMapper {
    func map(alamofireReachabilityStatus: NetworkReachabilityManager.NetworkReachabilityStatus) -> ReachabilityStatus {
        switch alamofireReachabilityStatus {
        case .notReachable: return .notReachable
        case .reachable(.ethernetOrWiFi): return .wifiOrCellular
        case .reachable(.wwan): return .wwan
        default: return .notReachable
        }
    }
}
