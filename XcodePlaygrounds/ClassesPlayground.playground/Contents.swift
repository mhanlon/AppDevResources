
class Animal {
    var name: String
    var picture = "🦄"
    
    init(name: String) {
        self.name = name
    }
    
    func speak() {
        print("")
    }
}

class Dog: Animal {
    
    override init(name: String) {
        super.init(name: name)
        self.picture = "🐶"
    }
    
    override func speak() {
        print("Woof!")
    }
}

class Fish: Animal {
    var numberOfFins = 2
}

let dog = Dog(name: "Waffles")
dog.speak()
print(dog.picture)

let animal = Animal(name: "Uni")

let fish = Fish(name: "Bubbles")

var nextPatient = Dog(name: "Waffles")
