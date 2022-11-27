import Cocoa


class Animal {
    var legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
    
}

class Dog: Animal {
    func speak(_ barking: String) {
        print("\(barking)")
    }
}

class Corgi: Dog {
    
    override func speak(_ barking: String) {
        print("Corgi: \(barking)")
    }
}

class Poodle: Dog {
    override func speak(_ barking: String) {
        print("Poodle: \(barking)")
    }
}

class Cat: Animal {
    var isTame: Bool
    
    init(isTame: Bool, legs: Int) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    func speak(_ sound: String) {
        print("\(sound)")
    }
}

class Persian: Cat {
    
}

class Lion: Cat {
    
}
