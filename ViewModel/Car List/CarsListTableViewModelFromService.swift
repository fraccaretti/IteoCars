import Foundation

class CarsListTableViewModelFromService: CarsListTableViewModel {
    
    let reachability: Reachability
    let carsService: CarsService
    let controllerTitle: String = "Car list"
    
    var isLoading: Observable<Bool>
    var errorMessage: Observable<String?>
    var cellViewModels: Observable<[CarsListCellViewModel]>
    var numberOfCells: Int {
        return cellViewModels.value.count
    }
    var selectedCar: Car?
    
    init(reachability: Reachability,
         carsService: CarsService) {
        self.reachability = reachability
        self.carsService = carsService
        self.isLoading = Observable(with: true)
        self.errorMessage = Observable(with: nil)
        let cellViewModelsList: [CarsListCellViewModel] = []
        self.cellViewModels = Observable(with: cellViewModelsList)
        
        reachability.addObserver(self)
    }
    
    func attach(carsList: CarsList) {
        let cellViewModelsList = carsList.content.map { car -> CarsListCellViewModel in
            return CarsListCellViewModelFromCar(with: car)
        }
        self.cellViewModels = Observable(with: cellViewModelsList)
    }
    
    private func populateCarsList() {
        isLoading.value = true
        carsService.getCarsList(completion: { [weak self] carsList in
            self?.errorMessage.value = nil
            self?.isLoading.value = false
            self?.attach(carsList: carsList)
        }, onError: { [weak self] error in
            self?.cellViewModels.value.removeAll()
            self?.isLoading.value = false
            self?.errorMessage.value = error.localizedDescription
        })
    }
}

extension CarsListTableViewModelFromService: ReachabilityObserver {
    
    func reachabilityStatusChanged(status: ReachabilityStatus) {
        switch status {
        case .wifiOrCellular: populateCarsList()
        default: isLoading.value = true
        }
    }
}
