import Cocoa


var temperatures = [4.5,15,20,33,2.1,0.5,-4]


temperatures.append(6.7)


var names = Array<Int>()

names.append(100)
names.append(300)
names.append(50)

print(names.count)

var movies = ["Casino Royale", "Spectre", "No time to Die"]

print(movies.contains("Frozen"))

movies.sorted();

var reversedMovies = movies.reversed()

print(reversedMovies)


// Making dictionaries

let employee = [
    "name": "Oj",
    "job": "Student",
    "location": "Canberra"
]

print(employee["name", default: "Unknown"])


var heights = [String:Int]()

heights["Oj"] = 175
heights["Shaquille O'Neal"] = 216


var archEnemies = [String: String]()
archEnemies["Batman"] = "The Joker"
archEnemies["Superman"] = "Lex Luthor"
archEnemies["Batman"] = "Penguin"

print(archEnemies["Batman"])



// Creating Sets
let actors = Set(["Denzel Washington", "Tom Cruise", "Nicolas Cage", "Samuel L. Jackson"])

print(actors)


var movies = Set<String>();
movies.insert("Top Gun: Maverick")


// Creating enums

enum Weekday {
    case monday, tuesday, wednesday, thursday, friday
}

var day = Weekday.monday

day = Weekday.tuesday
