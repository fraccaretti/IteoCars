import Foundation

class CarsListCellViewModelFromCar: CarsListCellViewModel {
    private(set) var car: Car
    var name: String {
        return car.name
    }
    var model: String {
        return car.model
    }
    
    init(with car: Car) {
        self.car = car
    }
}
