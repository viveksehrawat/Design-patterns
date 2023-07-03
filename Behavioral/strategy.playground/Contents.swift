import UIKit

//In Swift, the Strategy pattern is a behavioral design pattern that enables you to define a family of algorithms, encapsulate each one as a separate class, and make them interchangeable at runtime. This pattern allows you to select an algorithm at runtime based on specific requirements, without tightly coupling the client code to the implementation details.


protocol Strategy {
    func execute()
}

class ConcreteStrategyA : Strategy {
    func execute() {
        print("Executing Strategy A")
    }
}

class ConcreteStrategyB : Strategy {
    func execute() {
        print("Executing Strategy B")
    }
}

class Context {
    private var strategy: Strategy
    
    init(strategy: Strategy){
        self.strategy = strategy
    }
    
    func setStrategy(strategy: Strategy){
        self.strategy = strategy
    }
    
    func executeStrategy(){
        strategy.execute()
    }
}


let context = Context(strategy: ConcreteStrategyA())
context.executeStrategy()

context.setStrategy(strategy: ConcreteStrategyB())
context.executeStrategy()

