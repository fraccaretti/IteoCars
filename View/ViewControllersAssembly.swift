import Foundation
import Swinject
import SwinjectStoryboard

class ViewControllersAssembly: Assembly {
    func assemble(container: Container) {
        container.register(CarsListTableViewModel.self) { resolver -> CarsListTableViewModel in
            return CarsListTableViewModelFromService(reachability: resolver.resolve(Reachability.self)!,
                                                     carsService: resolver.resolve(CarsService.self)!)
        }
        container.register(CarsListRouting.self) { resolver -> CarsListRouting in
            return CarsListRouter()
        }
        container.storyboardInitCompleted(CarsListTableViewController.self) { resolver, controller in
            controller.viewModel = resolver.resolve(CarsListTableViewModel.self)!
            controller.router = resolver.resolve(CarsListRouting.self)!
        }
        
        container.register(CarDetailsViewModel.self) { resolver -> CarDetailsViewModel in
            return CarDetailsViewModelFromCar()
        }
        container.storyboardInitCompleted(CarDetailsViewController.self) { resolver, controller in
            controller.viewModel = resolver.resolve(CarDetailsViewModel.self)!
        }
        
        container.register(CarAddingFormViewModel.self) { resolver -> CarAddingFormViewModel in
            return CarAddingFormViewModelForService(reachability: resolver.resolve(Reachability.self)!,
                                                    carsService: resolver.resolve(CarsService.self)!,
                                                    repository: resolver.resolve(CarsRepository.self)!)
        }
        container.storyboardInitCompleted(CarAddingFormViewController.self) { resolver, controller in
            controller.viewModel = resolver.resolve(CarAddingFormViewModel.self)!
        }
    }
}
