import Foundation

enum NetworkingError: Error {
    case uploadDataIsNil
    case dataRequestFailedWithCode(code: Int)
}
