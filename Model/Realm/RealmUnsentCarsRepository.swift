import Foundation
import RealmSwift

class RealmUnsentCarsRepository: UnsentCarsRepository {
    private let realm: Realm
    private let mapper: CarMapper
    
    init(realm: Realm,
         mapper: CarMapper) {
        self.realm = realm
        self.mapper = mapper
    }
    
    func get(_ id: String) -> Car? {
        if let realmObject = realm.object(ofType: RealmCar.self, forPrimaryKey: id) {
            return mapper.map(realmObject)
        }
        return nil
    }
    
    func getAll() -> [Car] {
        let realmObjects = realm.objects(RealmCar.self)
        let cars = realmObjects.map { realmObject -> Car in
            return self.mapper.map(realmObject)
        }
        let carsArray = Array(cars)
        return carsArray
    }
    
    func add(_ car: Car) throws {
        do {
            try realm.write {
                let realmObject: RealmCar = mapper.map(car)
                realm.add(realmObject)
            }
        } catch {
            throw error
        }
    }
    
    func delete(_ id: String) throws {
        do {
            guard let realmObject: RealmCar = realm.object(ofType: RealmCar.self, forPrimaryKey: id) else { throw RealmError.objectNotFound }
            try realm.write {
                realm.delete(realmObject)
            }
        } catch {
            
        }
    }
    
    
}
