import Foundation

protocol CarAddingFormViewModel {
    var name: String { get }
    var model: String { get }
    var brand: String { get }
    var year: String { get }
    
    func addNewButtonTapped()
}
