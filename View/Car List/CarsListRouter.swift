import UIKit

class CarsListRouter: CarsListRouting {    
    weak var viewController: CarsListTableViewController?
    
    func routeToAddNewCar() {
        viewController?.performSegue(withIdentifier: viewController!.addNewCarSegueIdentifier, sender: nil)
    }
    
    func routeToCarDetails() {
        viewController?.performSegue(withIdentifier: viewController!.carDetailsSegueIdentifier, sender: nil)
    }
    
    func passCarToCarDetails(_ car: Car, withSegue segue: UIStoryboardSegue) {
        let destinationViewController = segue.destination as! CarDetailsViewController
        destinationViewController.viewModel?.attach(car)
    }
    
    func attach(_ viewController: CarsListTableViewController) {
        self.viewController = viewController
    }
}
