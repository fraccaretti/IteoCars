import Foundation

protocol CarDetailsViewModel {
    var car: Observable<Car>? { get }
    var name: String { get }
    var model: String { get }
    var brand: String { get }
    var year: String { get }
    
    func attach(_ car: Car)
}
