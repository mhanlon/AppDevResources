// MARK: -
// MARK: Enumerations and raw values
// If you use a non-integer or string, you will need to specify all raw values
// You don't get the free behavior of Ints where you can declare the first raw value of a case and it auto-increments
enum Score: Int {
    case one = 1
    case two
    case three
    case four
}
print(Score.three)

// Here you would get the message:
/// `Enum case must declare a raw value when the preceding raw value is not an integer`
// if you didn't specify the rawValue for each case.
enum StarScore: Double {
    case one = 1.0
    case two = 2.0
    case three = 3.1
    case four = 4.5
    case five = 5
}

// MARK: -
// MARK: Structures
// There are two examples in this code sample...
//      * first, saving our precious memberwise initializers by writing custom initializers in an extension
//      * second, we have a mutable type property... so that if we change that type property on the Person it has changed anywhere we might refer to it.
typealias Person = TemperaturePerson // This is only because I'm lazy and don't want to re-type the Person calls below...

struct TemperaturePerson {
    /// Maybe this is the point at which people get mad and it *could* change over time, but for ALL people...
    static var boilingPoint = 100.0
    
    let name: String
    var bankBalance = 0
}

let person1 = Person(name: "Áine")

let person2 = Person(name: "Dylan", bankBalance: 100)

Person.boilingPoint = 9 /// changing the 'static' property on our weird Temperature/Person type...


/// This is to make sure I still have the magic memberwise initializers...
extension Person {
    init(celcius: Int) {
        self.name = "\(celcius)"
    }
}
