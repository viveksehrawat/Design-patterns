import UIKit

//The State design pattern is a behavioral design pattern that allows an object to alter its behavior when its internal state changes. It encapsulates state-specific logic into separate classes, known as state classes, and the object delegates the behavior to the current state object. In Swift, you can implement the State design pattern using classes, protocols, and enums. Here's an example of implementing the State pattern in Swift:

class Order{
    var state: OrderState = NewOrderState()
    
    func proces(){
        state.process(self)
        
    }
    
    func cancel(){
        state.cancel(self)
        
    }
    
    func changeState(_ state: OrderState){
        self.state = state
    }
    
}

protocol OrderState{
    func process(_ order: Order)
    func cancel(_ order: Order)
}

class NewOrderState: OrderState {
    
    func process(_ order: Order){
        print("Processing new order")
        order.changeState(ProcessingOrderState())
        
    }
    
    func cancel(_ order: Order){
        print("Cancelling new order")

    }

    
}
class ProcessingOrderState: OrderState{
    func process(_ order: Order){
        print("Order is already being processed")
        
    }
    
    func cancel(_ order: Order){
        print("Cancelling processing order")
        order.changeState(CanceledOrderState())

    }
}


class CanceledOrderState: OrderState{
    func process(_ order: Order){
        print("Cannot process order")
        
    }
    
    func cancel(_ order: Order){
        print("Order is already cancelled")

    }
}


let order = Order()
order.proces()
order.cancel()
order.proces()
