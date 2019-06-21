import Foundation
import RealmSwift
import Realm

class RealmCar: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var model: String = ""
    @objc dynamic var brand: String = ""
    @objc dynamic var year: String = ""
    
    init(id: String,
         name: String,
         model: String,
         brand: String,
         year: String) {
        super.init()
        self.id = id
        self.name = name
        self.model = model
        self.brand = brand
        self.year = year
    }
    
    required init() {
        super.init()
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
