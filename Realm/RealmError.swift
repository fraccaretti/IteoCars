import Foundation

enum RealmError: Error {
    case objectNotFound
}

extension RealmError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .objectNotFound: return "Object not found".localize()
        }
    }
}
