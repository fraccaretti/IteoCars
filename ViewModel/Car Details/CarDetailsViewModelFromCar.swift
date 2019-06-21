import Foundation

class CarDetailsViewModelFromCar: CarDetailsViewModel {
    
    let controllerTitle: String = "Car Details"
    
    private(set) var car: Observable<Car>?
    
    var name: String {
        return car?.value.name ?? ""
    }
    var model: String {
        return car?.value.model ?? ""
    }
    var brand: String {
        return car?.value.brand ?? ""
    }
    var year: String {
        return car?.value.year ?? ""
    }
    
    func attach(_ car: Car) {
        self.car = Observable(with: car)
    }
}
