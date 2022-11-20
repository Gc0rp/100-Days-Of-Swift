import Cocoa


// For Loops
let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift works great on \(os).")
}

for i in 1...12 {
    print("5 x \(i) is \(5 * i)")
}


for i in 1...12 {
    print("The \(i) times table")
    
    for j in 1...12 {
        print("     \(j) x \(i) is \(j*i)")
    }
}


for i in 1..<5 {
    print("Couting from 1 up to 5: \(i)")
}



// While loop

var countdown = 10

while countdown > 0 {
    print("\(countdown)...")
    countdown -= 1
}

print("Blast Off!")


let id = Int.random(in: 1...1000)
let amount = Double.random(in: 0...1)

var roll = 0

while roll != 20 {
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}

print("Critical Hit")



let filenames = ["me.jpg", "work.txt", "sophie.jpg"]

for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
    }
    
    print("Found picture: \(filename)")
}



let number1 = 4
let number2 = 14
var multiples = [Int]()


for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)
        
        
        if multiples.count == 20 {
            break
        }
    }
}

print(multiples)
