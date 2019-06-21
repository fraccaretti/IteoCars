import Foundation

protocol UnsentCarsRepository {
    func get(_ id: String) -> Car?
    func getAll() -> [Car]
    func add(_ car: Car) throws
    func delete(_ id: String) throws
}
