import Foundation

/*
 The Visitor pattern is a design pattern that allows you to separate operations or algorithms from the objects on which they operate. It enables you to define new operations without modifying the classes of the objects on which they operate. In Swift, you can implement the Visitor pattern using protocols and dynamic dispatch.

 Here's an example of how to implement the Visitor pattern in Swift:
 */

protocol Shape{
    func accept(visitor: ShapeVisitor)
    
}

protocol ShapeVisitor{
    func visit(circle: Circle)
    func visit(rectangle: Rectangle)
    
}

class Circle: Shape{
    
    let radius: Double
    init(radius: Double){
        self.radius = radius
    }
    
    func accept(visitor: ShapeVisitor) {
        visitor.visit(circle: self)
    }
}

class Rectangle: Shape{
    let width: Double
    let height: Double
    
    init(height: Double, width: Double){
        self.height = height
        self.width = width
    }
    
    func accept(visitor: ShapeVisitor) {
        visitor.visit(rectangle: self)
    }
}

class AreaVisitor: ShapeVisitor{
    var totalArea: Double = 0.0
    
    func visit(circle: Circle) {
        totalArea += circle.radius
    }
    
    func visit(rectangle: Rectangle) {
        totalArea += rectangle.width
    }
}

let shapes: [Shape] = [Circle(radius: 5), Rectangle(height: 10, width: 10)]
let areaVisitor = AreaVisitor()
for shape in shapes{
    shape.accept(visitor: areaVisitor)
}

print(areaVisitor.totalArea)
