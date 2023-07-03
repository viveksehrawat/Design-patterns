import Foundation

//https://medium.com/swift-coding/the-observer-pattern-in-swift-97a0e6fafa58

protocol PropertyObserver: class{
    
    func willChange(propertyName: String, newPropertyValue: Any?)
    func didChange(propertyName: String, oldPropertyValue: Any?)
}


final class TestChambers {
    weak var observer: PropertyObserver?
    
    private let testChamberNumberName = "testChamberNumberName"
   
    var testChamberNumber: Int = 0{
        willSet{
            observer?.willChange(propertyName: testChamberNumberName, newPropertyValue: newValue)
        }
        didSet{
            observer?.didChange(propertyName: testChamberNumberName, oldPropertyValue: oldValue)
            
        }
    }
}

final class Observer: PropertyObserver{
    func willChange(propertyName: String, newPropertyValue: Any?) {
        
    }
    func didChange(propertyName: String, oldPropertyValue: Any?) {
        
    }
}

var observerInstance = Observer()
var testChambers = TestChambers()

testChambers.observer = observerInstance
testChambers.testChamberNumber += 1
