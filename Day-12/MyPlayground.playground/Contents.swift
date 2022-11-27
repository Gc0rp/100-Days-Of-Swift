import Cocoa

// Classes
class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10


class Employee {
    let hours: Int
    
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}


// final keyword so that another class cannot inherit from developer
final class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times will spend hours aruging weather code should be intended using tabs or spaces.")
    }
}

// final keyword so that another class cannot inherit from manager
final class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}


let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)

robert.work()
joseph.work()

let novall = Developer(hours: 8)
novall.printSummary()




class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}


class Car: Vehicle {
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}


let teslaX = Car(isElectric: true, isConvertible: false)



// Copying Classes


class User {
    var username = "Anonymous"
    let id: Int

    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }

    func copy() -> User {
        let user = User(id: self.id)
        user.username = username
        return user
    }

    deinit {
        print("User \(id): I'm dead!")
    }
}

var user1 = User(id: 1)
var user2 = user1.copy()
user2.username = "Taylor"


print(user1.username)
print(user2.username)


var users = [User]()

for i in 1...3 {
    let user = User(id: i)
    print("User \(user.id): I'm in control!")
}

print("Loop is finished")
users.removeAll()
print("Array is clear!")


