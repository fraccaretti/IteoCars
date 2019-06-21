import Foundation

protocol CarsService {
    var networking: Networking { get }
    
    func getCarsList(completion: @escaping (CarsList) -> Void, onError: @escaping (Error) -> Void)
    func uploadCar(_ car: Car, completion: @escaping () -> Void, onError: @escaping (Error) -> Void)
}
