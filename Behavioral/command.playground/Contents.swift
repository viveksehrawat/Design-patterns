import Foundation


protocol DoorCommand{
    func execute() -> String
}


final class OpenCommand: DoorCommand{
    
    let door: String
    required init(door: String){
        self.door = door
    }
    
    func execute()-> String{
        return "Opened \(door)"
    }
}


final class CloseCommand : DoorCommand{
    
    let door: String
    
    required init(door: String) {
        self.door = door
    }
    
    func execute()-> String{
        return "Closed \(door)"
    }
}


final class TestOperations{
    private let openCommand: DoorCommand
    private let closedCommand: DoorCommand
    
    init(door: String) {
        self.openCommand = OpenCommand(door: door)
        self.closedCommand = CloseCommand(door: door)
    }
    
    func close() -> String{
        return closedCommand.execute()
    }
    
    func open() -> String{
        return openCommand.execute()
    }
}


var testCommand = TestOperations(door: "Main Door")
testCommand.open()
testCommand.close()

