import Foundation
import Swinject
import RealmSwift

class RealmAssembly: Assembly {
    func assemble(container: Container) {
        container.register(Realm.Configuration.self) { _ in
            return RealmConfiguration.get()
        }
        container.register(Realm.self) { resolver -> Realm in
            return try! Realm(configuration: resolver.resolve(Realm.Configuration.self)!)
        }
    }
}
