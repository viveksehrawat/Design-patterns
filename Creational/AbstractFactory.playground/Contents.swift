import UIKit

protocol GUIFactory {
    func createButton() -> Button
    func createTextField() -> TextField
    
}

class IOSFactory: GUIFactory{
    func createButton() -> Button {
        return IOSButton()
        
    }
    func createTextField() -> TextField {
        return IOSTextField()
    }
}

class MacOSFactory: GUIFactory{
    func createButton() -> Button {
        return MacOSButton()
        
    }
    
    func createTextField() -> TextField {
        return MacOSTextField()
    }
}


protocol Button{
    func render()
}

class IOSButton: Button{
    func render() {
        print("iOS Button")
    }
}

class MacOSButton: Button{
    func render() {
        print("MacOS Button")
    }
}

// Abstract product: TextField
protocol TextField {
    func render()
}

// Concrete product for iOS platform: TextField
class IOSTextField: TextField {
    func render() {
        print("Rendering an iOS text field")
    }
}

// Concrete product for macOS platform: TextField
class MacOSTextField: TextField {
    func render() {
        print("Rendering a macOS text field")
    }
}


// Usage
let iosFactory: GUIFactory = IOSFactory()
let iosButton = iosFactory.createButton()
let iosTextField = iosFactory.createTextField()

iosButton.render() // Output: Rendering an iOS button
iosTextField.render() // Output: Rendering an iOS text field

let macosFactory: GUIFactory = MacOSFactory()
let macosButton = macosFactory.createButton()
let macosTextField = macosFactory.createTextField()

macosButton.render() // Output: Rendering a macOS button
macosTextField.render() // Output: Rendering a macOS text field
