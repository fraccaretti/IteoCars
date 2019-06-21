import Foundation
import Swinject
import RealmSwift

class ModelAssembly: Assembly {
    func assemble(container: Container) {
        container.register(CarMapper.self) { _ in
            return CarMapper()
        }
        container.register(CarSerializer.self) { resolver -> CarSerializer in
            return CarSerializer(jsonEncoder: resolver.resolve(JSONEncoder.self)!,
                                 jsonDecoder: resolver.resolve(JSONDecoder.self)!,
                                 mapper: resolver.resolve(CarMapper.self)!)
        }
        container.register(CarsRepository.self) { resolver -> CarsRepository in
            return RealmCarsRepository(realm: resolver.resolve(Realm.self)!,
                                       mapper: resolver.resolve(CarMapper.self)!)
        }
    }
}
