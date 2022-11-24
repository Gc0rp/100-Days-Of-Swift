import Cocoa

// Closures

func greetUser() {
    print("Hi there")
}

greetUser()

var greetCopy = greetUser

greetCopy()


let sayHello = { (name: String) -> String in
    "Hi \(name)!"
}


func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989)
print(user)


sayHello("Taylor")


let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)


// Make Suzanne come first no matter what
func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
}


//let captainFirstTeam = team.sorted(by: captainFirstSorted)
//
//print(captainFirstTeam)


let captainFirstTeam = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }
    
    return $0 < $1
}

print(captainFirstTeam)


let reverseTeam = team.sorted {$0 > $1}

let tOnly = team.filter {$0.hasPrefix("T")}
print(tOnly)

let uppercaseTeam = team.map{ $0.uppercased()}
print(uppercaseTeam)
