import Foundation

class CarSerializer {
    private let jsonEncoder: JSONEncoder
    private let jsonDecoder: JSONDecoder
    private let mapper: CarMapper
    
    init(jsonEncoder: JSONEncoder,
         jsonDecoder: JSONDecoder,
         mapper: CarMapper) {
        self.jsonEncoder = jsonEncoder
        self.jsonDecoder = jsonDecoder
        self.mapper = mapper
    }
    
    func serialize(_ car: Car, ignoreId: Bool) -> Data? {
        do {
            let codableObject: CodableCar = mapper.map(car)
            if ignoreId { codableObject.id = nil }
            return try jsonEncoder.encode(codableObject)
        } catch {
            return nil
        }
    }
    
    func deserialize(_ data: Data) -> CarsList? {
        do {
            let codableObject = try jsonDecoder.decode(CodableCarsList.self, from: data)
            return mapper.map(codableObject)
        } catch {
            return nil
        }
    }
}
