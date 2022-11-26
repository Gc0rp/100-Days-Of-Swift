import Cocoa


struct Car {
    public var model: String
    public var seats: Int
    private(set) var currentGear: Int
    
    init(model: String, numberOfSeats: Int) {
        self.model = model
        self.seats = numberOfSeats
        currentGear = 0
    }
    
    mutating func changeGear(to direction: String) {
        if (direction.uppercased() == "UP" && (currentGear + 1) <= 10) {
            currentGear += 1
            print("Changing gear to \(currentGear)")
        } else if(direction.uppercased() == "DOWN") {
            if(currentGear - 1 >= 0) {
                currentGear -= 1
                print("Changing gear to \(currentGear)")
            } else {
                print("The gear is already at 0, cannot go any lower")
            }
        }
    }
}


var newCar = Car(model: "Ferrari", numberOfSeats: 2)

newCar.changeGear(to: "UP")
newCar.changeGear(to: "UP")
newCar.changeGear(to: "UP")
newCar.changeGear(to: "DOWN")
newCar.changeGear(to: "UP")
newCar.changeGear(to: "UP")

