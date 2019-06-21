import Foundation

class CodableCarsList: Codable {
    let content: [CodableCar]
    
    init(carsList: [CodableCar]) {
        self.content = carsList
    }
}
