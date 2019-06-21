import Foundation

class CarAddingFormViewModelForService: CarAddingFormViewModel {
    let controllerTitle: String = "Add Car Form"
    
    private let reachability: Reachability
    private let carsService: CarsService
    private let repository: UnsentCarsRepository
    
    var name: String = ""
    var model: String = ""
    var brand: String = ""
    var year: String = ""
    
    var brokenRules: [CarAddingFormBrokenRule] = []
    var isValid: Bool {
        brokenRules = []
        validate()
        return brokenRules.isEmpty
    }
    
    init(reachability: Reachability,
         carsService: CarsService,
         repository: UnsentCarsRepository) {
        self.reachability = reachability
        self.carsService = carsService
        self.repository = repository
    }
    
    func addNewButtonTapped() {
        let car = assembleCarFromFields()
        sendCarToService(car)
    }
    
    private func assembleCarFromFields() -> Car {
        return Car(id: UUID().uuidString,
                   name: name,
                   model: model,
                   brand: brand,
                   year: year)
    }
    
    private func sendCarToService(_ car: Car) {
        carsService.uploadCar(car, completion: {
        }, onError: { [weak self] error in
            try? self?.repository.add(car)
        })
    }
    
    private func sendUnsentCars() {
        let cars = repository.getAll()
        for car in cars {
            try? repository.delete(car.id)
            sendCarToService(car)
        }
    }
    
    private func validate() {
        if !CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: year)) {
            brokenRules.append(CarAddingFormBrokenRule(propertyName: "Year", message: "Year should contains only integer numbers"))
        }
        if name.isEmpty {
            brokenRules.append(CarAddingFormBrokenRule(propertyName: "Name", message: "Name couldn't be empty"))
        }
        if model.isEmpty {
            brokenRules.append(CarAddingFormBrokenRule(propertyName: "Model", message: "Model couldn't be empty"))
        }
        if brand.isEmpty {
            brokenRules.append(CarAddingFormBrokenRule(propertyName: "Brand", message: "Brand couldn't be empty"))
        }
        if year.isEmpty {
            brokenRules.append(CarAddingFormBrokenRule(propertyName: "Year", message: "Year couldn't be empty"))
        }
    }
}

extension CarAddingFormViewModelForService: ReachabilityObserver {
    func reachabilityStatusChanged(status: ReachabilityStatus) {
        switch status {
        case .wifiOrCellular: sendUnsentCars()
        default: break
        }
    }
}
