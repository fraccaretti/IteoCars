import Foundation

class CarMapper {
    
    func map(_ car: Car) -> RealmCar {
        return RealmCar(id: car.id,
                        name: car.name,
                        model: car.model,
                        brand: car.brand,
                        year: car.year)
    }
    
    func map(_ realmObject: RealmCar) -> Car {
        return Car(id: realmObject.id,
                   name: realmObject.name,
                   model: realmObject.model,
                   brand: realmObject.brand,
                   year: realmObject.year)
    }
    
    func map(_ carData: Car) -> CodableCar {
        return CodableCar(id: carData.id,
                          name: carData.name,
                          model: carData.model,
                          brand: carData.brand,
                          year: carData.year)
    }
    
    func map(_ codableCarsList: CodableCarsList) -> CarsList {
        let carsList = codableCarsList.content.map { codableCar -> Car in
            return map(codableData: codableCar)
        }
        return CarsList(carsList: carsList)
    }
    
    private func map(codableData: CodableCar) -> Car {
        return Car(id: codableData.id,
                   name: codableData.name,
                   model: codableData.model,
                   brand: codableData.brand,
                   year: codableData.year)
    }
}
