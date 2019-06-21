import Foundation

extension AppDelegate {
    func sendAllUnsentCars() {
        let repository = assembler.resolver.resolve(UnsentCarsRepository.self)!
        let service = assembler.resolver.resolve(CarsService.self)!
        
        let cars = repository.getAll()
        for car in cars {
            service.uploadCar(car, completion: {
                try? repository.delete(car.id)
            }) { _ in
            }
        }
    }
}
