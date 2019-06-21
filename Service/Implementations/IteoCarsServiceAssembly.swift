import Foundation
import Swinject

class IteoCarsServiceAssembly: Assembly {
    func assemble(container: Container) {
        container.register(IteoCarsService.self) { resolver -> IteoCarsService in
            return IteoCarsService(networking: resolver.resolve(Networking.self)!,
                                   serializer: resolver.resolve(CarSerializer.self)!,
                                   mapper: resolver.resolve(CarMapper.self)!)
        }
    }
}
