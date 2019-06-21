import Foundation

struct CarAddingFormBrokenRule {
    let propertyName: String
    let message: String
    
    init(propertyName: String, message: String) {
        self.propertyName = propertyName
        self.message = message
    }
}
