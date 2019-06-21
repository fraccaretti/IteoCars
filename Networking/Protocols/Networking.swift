import Foundation

protocol Networking {
    func performDataRequest(_ request: Request,
                            completion: ((Data) -> Void)?,
                            onError: @escaping (Error) -> Void)
    func uploadData(_ request: Request,
                    completion: @escaping () -> Void,
                    onError: @escaping (Error) -> Void)
}
