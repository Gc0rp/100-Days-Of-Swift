import Cocoa

func showWelcome() {
    print("Welcome to the app")
    print("By default This prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
}

func printTimesTables(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) * \(number) is \(i * number)")
    }
}

printTimesTables(number: 5, end: 10)


func rollDice() -> Int{
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)


func stringCompare(s1: String, s2: String) -> Bool {
    var sortedS1 = s1.sorted()
    var sortedS2 = s2.sorted()
    
    if(sortedS1 == sortedS2) {
        return true
    }
    
    return false
}

print(stringCompare(s1: "testing", s2: "testing"))


func pythagoras(a: Double, b: Double) -> Double {
    let input = a * a + b * b
    let root = sqrt(input)
    return root
}

let c = pythagoras(a: 3, b: 4)
print(c)


// Returning multiple values

func getName() -> (String, String) {
    return ("Oj", "G")
}

let name = getName()
print("Name: \(name.0) \(name.1)")

let (firstName, lastName) = getName()
print("Name: \(firstName) \(lastName)")



// Customizing parameter labels
func isUppercase (_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO WORLD"
var isUpperCaseResult = isUppercase(string)
print(isUpperCaseResult)


func timesTable(for number: Int) {
    for i in 1...12 {
        print ("\(i) x \(number) is \(i * number)")
    }
}

timesTable(for: 5)
