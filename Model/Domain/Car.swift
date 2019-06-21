import Foundation

struct Car {
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
}
