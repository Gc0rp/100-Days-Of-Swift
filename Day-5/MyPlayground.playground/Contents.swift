import Cocoa

// If statements
let speed = 88
let percentage = 85
let age = 18

if speed >= 88 {
    print("Where we are going, we don't need roads")
}

if percentage < 85 {
    print("Sorry, you failed the test.")
}

if age >= 18 {
    print("You're eligible to vote")
}


let ourName = "Oj"
let friendName = "Elmo"

if ourName < friendName {
    print("It's our name \(ourName) vs \(friendName)")
}

if ourName > friendName {
    print("It's our name \(ourName) vs \(friendName)")
}


var numbers = [1,2,3]
numbers.append(4)

if numbers.count > 3 {
    numbers.remove(at: 0)
}

print(numbers)


let country = "Canada"

if country == "Australia" {
    print("G'day")
}


var name = "Oj"

if name != "Anonymous" {
    print("Welcome \(name)")
}

name = ""

if name.isEmpty == true {
    name="Anonymous"
}

print("Welcome \(name)")


// If, else if and else
enum TransportOption {
    case airplane, helicopter, bicycle, car, escooter
}


let transport = TransportOption.airplane

if transport == .airplane || transport == .helicopter {
    print("Let's fly")
} else if transport == .bicycle {
    print("I hope there's a bike path")
} else if transport == .car {
    print("Time to get stuck in traffic")
} else {
    print("I'm going to hire a scooter now.")
}



// Case statements

enum Weather {
    case sun, rain, wind, snow, unknown
}

var forecast = Weather.snow

switch forecast {
case .sun:
    print("It should be a nice day.")
case .rain:
    print("Pack an umbrella")
case .wind:
    print("Wear something warm")
case .snow:
    print("School is cancelled")
case .unknown:
    print("Our forecast generator is broken!")
}



let place = "Wakanda"

switch place {
case "Gotham":
    print("You're Batman")

case "Mega-city One":
    print("You're Judge Dred")

case "Wakanda":
    print("You're Black Panther")

default:
    print("Who are you?")
}



let day = 5
print ("My true love gave to me...")

switch day{
case 5:
    print("5 golden rings")
case 4:
    print("4 calling birds")
case 3:
    print("3 French hens")
case 2:
    print("2 turtle doves")
default:
    print("A partridge in a pear tree")
}


// Ternary Operator
let canVote:String = age >= 18 ? "Yes" : "No"
print(canVote)

let hour = 23
print(hour < 12 ? "It's before noon" : "It's after noon")

let names = ["Jayne", "Kaylee", "Mal"]
let crewCount = names.isEmpty ? "No one" : "\(names.count) people"

print(crewCount)


enum Theme {
    case light, dark
}

let theme = Theme.dark

let background = theme == .dark ? "black" : "white"
print(background)
