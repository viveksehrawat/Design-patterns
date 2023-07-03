import UIKit

protocol Transporting {
    func getSpeed() -> Double
    func getTraction() -> Double
}

final class RaceCar : Transporting {
    private let speed = 10.0
    private let traction  = 10.0
    
    func getSpeed() -> Double {
        return speed
    }
    
    func getTraction() -> Double{
        return traction
    }
}

let raceCar = RaceCar()
let defaultSpeed = raceCar.getSpeed()
let defaultTraction = raceCar.getTraction()

class OffRoadTireDecorator: Transporting {
  private let transportable: Transporting
  
  init(transportable: Transporting) {
    self.transportable = transportable
  }
  
  func getSpeed() -> Double {
    return transportable.getSpeed() - 3.0
  }
  
  func getTraction() -> Double {
    return transportable.getTraction() + 3.0
  }
}

''// Create Race Car
let defaultRaceCar = RaceCar()
defaultRaceCar.getSpeed() // 10
defaultRaceCar.getTraction() // 10

// Modify Race Car
let offRoadRaceCar = OffRoadTireDecorator(transportable: defaultRaceCar)
offRoadRaceCar.getSpeed() // 7
offRoadRaceCar.getTraction() // 13


protocol Beverage {
    func getDescription() -> String
    func getCost() -> Double
}

struct Coffee: Beverage {
    func getDescription() -> String {
        return "Coffee"
    }
    
    func getCost() -> Double {
        return 2.0
    }
}

// Decorator struct
struct CoffeeDecorator: Beverage {
    private let wrappedCoffee: Beverage
    
    init(coffee: Beverage) {
        self.wrappedCoffee = coffee
    }
    
    func getDescription() -> String {
        return wrappedCoffee.getDescription()
    }
    
    func getCost() -> Double {
        return wrappedCoffee.getCost()
    }
}

// Concrete decorator structs
struct MilkDecorator: Beverage {
    private let wrappedCoffee: Beverage
    
    init(coffee: Beverage) {
        self.wrappedCoffee = coffee
    }
    
    func getDescription() -> String {
        return wrappedCoffee.getDescription() + ", Milk"
    }
    
    func getCost() -> Double {
        return wrappedCoffee.getCost() + 0.5
    }
}

struct SugarDecorator: Beverage {
    private let wrappedCoffee: Beverage
    
    init(coffee: Beverage) {
        self.wrappedCoffee = coffee
    }
    
    func getDescription() -> String {
        return wrappedCoffee.getDescription() + ", Sugar"
    }
    
    func getCost() -> Double {
        return wrappedCoffee.getCost() + 0.25
    }
}

// Usage
var coffee: Beverage = Coffee()
coffee = MilkDecorator(coffee: coffee)
coffee = SugarDecorator(coffee: coffee)

print(coffee.getDescription())  // Output: Coffee, Milk, Sugar
print(coffee.getCost())  // Output: 2.75
