import Cocoa

// REVIEW


let employee = [
    "name": "Taylor",
    "job": "Singer"
]
print(employee["job", default: "Unknown"])

var albums: Array<String> = ["Red", "Fearless"]
var user: [String: String] = ["id": "@twostraws"]

for _ in 1...5 {
    print("meow")
}

func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let (firstName, _) = getUser()
print("Name: \(firstName)")


enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    if password == "12345" {
        throw PasswordError.obvious
    }
    if password.count < 10 {
        return "OK"
    } else {
        return "Good"
    }
}


do {
    let result = try checkPassword("12345")
    print("Rating: \(result)")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error.")
}

let sayHello = { (name: String) -> String in
    "Hi, \(name)!"
}


let team = ["Gloria", "Suzanne", "Tiffany", "Tasha"]

let onlyT = team.filter { $0.hasPrefix("T")}


struct Employee {
    let name: String
    var vacationAllowed = 24
    var vacationTaken = 0
    
    var vacationRemaining: Int {
        get {
            vacationAllowed - vacationTaken
        }
        
        set {
            vacationAllowed = vacationTaken + newValue
        }
    }
}



struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}


struct Player {
    let name: String
    let number: Int
    
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}



struct BankAccount {
    var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}



class Site {
    let id: Int
    
    
    init(id: Int) {
        self.id = id
        print("Site \(id): I've been created")
    }
    
    
    deinit {
        print("Site \(id): I've been destroyed!")
    }
}


protocol Vehicle {
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car: Vehicle {
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance)km")
    }
    
    func openSunroof () {
        print("It's a nice day!")
    }
}


extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

var quote = "      The truth is rarely pure and never simple.        "
let trimmed = quote.trimmed()



let opposites = [
    "Mario":"Wario",
    "Luigi": "Waluigi"
]

let peachOpposite = opposites["Peach"]


// Runs if mario exists inside the array
if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}



func printSquare(of number:Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }
    
    print("\(number) x \(number) is \(number * number)")
}


let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favourite = tvShows.randomElement() ?? "None"

let input = ""
let number = Int(input) ?? 0
print(number)


let names = ["Arya", "Bran", "Robb", "Sansa"]
let chosen = names.randomElement()?.uppercased()
print("Next in line \(chosen ?? "No one")")



enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}
