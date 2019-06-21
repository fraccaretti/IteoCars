import Foundation

protocol CarAddingFormViewModel {
    var controllerTitle: String { get }
    
    var name: String { get set }
    var model: String { get set }
    var brand: String { get set }
    var year: String { get set }
    
    var brokenRules: [CarAddingFormBrokenRule] { get }
    var isValid: Bool { get }
    
    func addNewButtonTapped()
}
