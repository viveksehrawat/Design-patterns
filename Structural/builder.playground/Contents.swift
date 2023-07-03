class Pizza {
    var size: String = ""
    var cheese: Bool = false
    var pepperoni: Bool = false
    var mushrooms: Bool = false
    
    // Additional pizza properties and methods...
}

class PizzaBuilder {
    private var pizza: Pizza
    
    init() {
        pizza = Pizza()
    }
    
    func setSize(_ size: String) -> PizzaBuilder {
        pizza.size = size
        return self
    }
    
    func addCheese() -> PizzaBuilder {
        pizza.cheese = true
        return self
    }
    
    func addPepperoni() -> PizzaBuilder {
        pizza.pepperoni = true
        return self
    }
    
    func addMushrooms() -> PizzaBuilder {
        pizza.mushrooms = true
        return self
    }
    
    func build() -> Pizza {
        return pizza
    }
}

// Usage:
let pizza = PizzaBuilder()
    .setSize("Large")
    .addCheese()
    .addPepperoni()
    .build()
