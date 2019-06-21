import UIKit

protocol CarsListRouting {
    func routeToAddNewCar()
    func routeToCarDetails()
    func passCarToCarDetails(_ car: Car, withSegue segue: UIStoryboardSegue)
    func attach(_ viewController: CarsListTableViewController)
}
