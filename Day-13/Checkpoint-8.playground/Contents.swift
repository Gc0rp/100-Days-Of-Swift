import Cocoa


protocol Building {
    var rooms: Int {get set}
    var cost: Int   {get set}
    var estateAgent: String {get set}
    
    func printSummary() -> Void
}


struct House: Building {
    var rooms = 0
    var cost = 0
    var estateAgent = "Oj"
    
    func printSummary() {
        print("The house has \(rooms) and costs \(cost), estate agent is \(estateAgent)")
    }
}


struct Office: Building {
    var rooms = 0
    var cost = 0
    var estateAgent = "Elmo"
    
    func printSummary() {
        print("The house has \(rooms) and costs \(cost), estate agent is \(estateAgent)")
    }
}

var myHouse = House()
var myOffice = Office()

myHouse.printSummary()
myOffice.printSummary()
