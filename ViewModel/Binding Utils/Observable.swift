import Foundation

// Inspired with https://five.agency/solving-the-binding-problem-with-swift/ by Srđan Rašić
class Observable<T> {
    var value: T {
        didSet {
            DispatchQueue.main.async {
                self.valueChanged?(self.value)
            }
        }
    }
    
    var valueChanged: ((T) -> Void)?
    
    init(with value: T) {
        self.value = value
    }
}
