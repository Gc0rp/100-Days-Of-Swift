import Cocoa

enum SquareRootError:Error {
    case outOfBounds, noRoot
}

func squareRoot(of number: Int) throws -> Int{
    var endPoint = number / 2
    
    if number < 1 || number > 10000 {
        throw SquareRootError.outOfBounds
    } else if (number == 1) {
        return 1
    } else {
        for i in 2...endPoint {
            if i * i == number {
                return i
                break;
            }
        }
    }
    
    throw SquareRootError.noRoot
    
}


do {
    try print(squareRoot(of: 20000))
} catch SquareRootError.noRoot {
    print("No root found")
} catch SquareRootError.outOfBounds {
    print("Out of bounds")
} catch {
    print("There is an error: \(error.localizedDescription)")
}

