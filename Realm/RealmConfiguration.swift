import Foundation
import RealmSwift

class RealmConfiguration {
    static func get() -> Realm.Configuration {
        return Realm.Configuration(schemaVersion: 1,
                                   deleteRealmIfMigrationNeeded: false
        )}

}
