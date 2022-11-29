import Cocoa

// Optionals
let opposites = ["Mario": "Wario", "Luigi": "Waluigi"]
let peachOpposite = opposites["Peach"]


if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}


var userName: String? = nil

if let unwrappedName = userName {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty")
}

var num1 = 1_000_000
var num2 = 0
var num3: Int? = nil

var str1 = "Hello"
var str2 = ""
var str3: String? = nil

var arr1 = [0]
var arr2 = [Int]()
var arr3: [Int]? = nil


func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil


if let unwrappedNumber = number {
    print(square(number: unwrappedNumber))
}



// Unwrap optionals with guard


func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }
    
    print("\(number) x \(number) is \(number * number)")
}


var myVar: Int? = 3

//if let unwrapped = myVar {
    // Run if myVar has a value inside
//}

//guard let unwrapped = myVar else {
//
//}



// Unwrap optionals with nil coalescing


let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Definant": "Sisko"
]

let new = captains["Serenity", default: "N/A"]

struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"
print(author)


let input = ""
let n = Int(input) ?? 0
print(n)



// Optional chaining
let names = ["Arya", "Bran", "Robb", "Sansa"]
let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")

var myBook: Book? = nil
let myBookAuthor = myBook?.author?.first?.uppercased() ?? "A"
print(myBookAuthor)


// Function failure with optionals
enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}

let user = (try? getUser(id: 23)) ?? "Anonymous"
print(user)


