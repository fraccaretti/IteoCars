import Foundation

class CarAddingFormViewModelForService: CarAddingFormViewModel {
    private let reachability: Reachability
    private let carsService: CarsService
    private let repository: CarsRepository
    
    var name: String = ""
    var model: String = ""
    var brand: String = ""
    var year: String = ""
    
    init(reachability: Reachability,
         carsService: CarsService,
         repository: CarsRepository) {
        self.reachability = reachability
        self.carsService = carsService
        self.repository = repository
    }
    
    func addNewButtonTapped() {
        
    }
}

extension CarAddingFormViewModelForService: ReachabilityObserver {
    func reachabilityStatusChanged(status: ReachabilityStatus) {
        
    }
}
