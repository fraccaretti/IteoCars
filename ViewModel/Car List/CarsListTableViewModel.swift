import Foundation

protocol CarsListTableViewModel {
    var controllerTitle: String { get }
    var isLoading: Observable<Bool> { get }
    var errorMessage: Observable<String?> { get }
    var cellViewModels: Observable<[CarsListCellViewModel]> { get }
    var numberOfCells: Int { get }
    var selectedCar: Car? { get set }
    
    func attach(carsList: CarsList)
    func refreshButtonTapped()
}
