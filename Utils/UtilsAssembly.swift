import Foundation
import Swinject

class UtilsAssembly: Assembly {
    func assemble(container: Container) {
        container.register(JSONDecoder.self) { _ in
            return JSONDecoder()
        }.inObjectScope(.container)
        container.register(JSONEncoder.self) { _ in
            return JSONEncoder()
        }.inObjectScope(.container)
    }
}
