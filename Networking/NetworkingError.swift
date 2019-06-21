import Foundation

enum NetworkingError: Error {
    case uploadDataIsNil
    case dataRequestFailedWithCode(_ code: Int)
    case uploadRequestFailedWithCode(_ code: Int)
}

extension NetworkingError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .uploadDataIsNil: return "Upload data is empty".localize()
        case .dataRequestFailedWithCode(let code): return "Request failed with code".localize() + ": \(code)"
        case .uploadRequestFailedWithCode(let code): return "Upload failed with code".localize() + ": \(code)"
        }
    }
}
