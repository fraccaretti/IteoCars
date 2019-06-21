import Foundation

class CodableCar: Codable {
    let id: String
    let name: String
    let model: String
    let brand: String
    let year: String
    
    init(id: String,
         name: String,
         model: String,
         brand: String,
         year: String) {
        self.id = id
        self.name = name
        self.model = model
        self.brand = brand
        self.year = year
    }
    
    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name = "name"
        case model = "model"
        case brand = "brand"
        case year = "year"
    }
}
