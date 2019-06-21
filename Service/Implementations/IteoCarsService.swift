import Foundation
import Alamofire

class IteoCarsService: CarsService {
    
    let networking: Networking
    private let mapper: CarMapper
    private let serializer: CarSerializer
    private let endpoints = IteoCarsServiceEndpoints()
    
    init(networking: Networking,
         serializer: CarSerializer,
         mapper: CarMapper) {
        self.networking = networking
        self.serializer = serializer
        self.mapper = mapper
    }
    
    func getCarsList(completion: @escaping (CarsList) -> Void, onError: @escaping (Error) -> Void) {
        let request = Request(data: nil,
                              url: endpoints.getCarsEndpoint(),
                              method: HTTPMethod.get,
                              parameters: nil,
                              headers: IteoHeaders.getAllHeaders())
        
        networking.performDataRequest(request, completion: { jsonData in
            guard let carsList = self.serializer.deserialize(jsonData) else {
                onError(CarServiceError.invalidResponseFormat)
                return
            }
            completion(carsList)
        }, onError: onError)
    }
    
    func uploadCar(_ car: Car, completion: @escaping () -> Void, onError: @escaping (Error) -> Void) {
        guard let jsonData = serializer.serialize(car, ignoreId: true) else {
            onError(CarServiceError.invalidDataFormat)
            return
        }
        let request = Request(data: jsonData,
                              url: endpoints.getCarsEndpoint(),
                              method: .post,
                              parameters: nil,
                              headers: IteoHeaders.getAllHeaders())
        networking.uploadData(request, completion: completion, onError: onError)
    }
}
