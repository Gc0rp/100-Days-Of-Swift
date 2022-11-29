import Cocoa


func getInt(intList: [Int]?) -> Int { return intList?.randomElement() ?? Int.random(in: 1...100) }

print(getInt(intList: [1,2,3]))
