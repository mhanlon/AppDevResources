// From Constants, Variables, and Data Types

// Can you assign a Int to a Double variable (or constant)?

let intVal = 9
let firstDoubleVal: Double  = 6 // This is a valid 'Int' that Swift stores as a Double because we tell it to thanks to type annotation
// Un-comment this next line to see that this will throw a compiler error because we can't auto-convert an Int to a Double due to Swift's type safety rules.
//let secondDoubleVal: Double = intVal

// To assign the value of a variable or constant that is of type `Int` to a Double variable



// From Structures
struct Temperature {
    var celsius: Double
    
    // You can also set computer properties... and you implement it like so:
    // `newValue` is the default parameter which is passed to the computed setter
    var fahrenheit: Double {
        get {
            celsius * 1.8 + 32
        }
        set {
            self.celsius = ( newValue - 32 ) * 1.8
        }
    }
}

var temperature = Temperature(celsius: 100)
print(temperature.fahrenheit)
temperature.fahrenheit = 32
temperature.celsius

// From Classes
class ClassVersionOfTemperature {
    var celsius: Double
    
    // You can also set computer properties... and you implement it like so:
    // `newValue` is the default parameter which is passed to the computed setter
    var fahrenheit: Double {
        get {
            celsius * 1.8 + 32
        }
        set {
            self.celsius = ( newValue - 32 ) * 1.8
        }
    }
    
    init(celsius: Double) {
        self.celsius = celsius
    }
}
var cTemperature = Temperature(celsius: 100)
print(cTemperature.fahrenheit)
cTemperature.fahrenheit = 32
cTemperature.celsius



// Using NumberFormatter with String input you attempt to turn into an Int
import Foundation

let stringInput = "1234"
// We have to use conditional binding to unwrap our Int/NSNumber
if let number = Int(stringInput) {
    
    let formatter = NumberFormatter()
    formatter.locale = NSLocale.current
    formatter.numberStyle = .spellOut
    let formattedNumberString = formatter.string(from: NSNumber(value: number))
    if let formattedNumberString = formattedNumberString { // Using variable shadowing
        print(formattedNumberString)
    }
}


// An example of how we can speak text out loud
import AVFoundation
let synthesizer = AVSpeechSynthesizer()
let utterance = AVSpeechUtterance(string: "Hello there!")
synthesizer.speak(utterance)


/// From Develop in Swift Data Collections (https://apple.co/developinswiftdatacollections)
// The four types of closures:
// 1. The closure takes no parameters, returns no value
let yellingClosure = { print("Ahhh!") }

// 2. This closure takes a parameter and returns no values
let checkinClosure = { ( animalName: String ) in
    print("We have checked in \(animalName)")
}

// 3. This closure takes no parameters but returns a value. Note how we can leave off the `in` keyword
// and the return type is inferred by Swift
let randomNumberClosure = { return 9 }

// 4. This closure has parameters and returns a value.
// NB. We can leave off the return type, and the `return` keyword, since this
// is a one-line function. We call our #3 closure with '()' at the end of the
// named function
let specialClassMathClosure = { (firstNumber: Int, secondNumber: Int) in
    firstNumber + randomNumberClosure() + secondNumber
}

// When we call closures with parameters we leave off the parameter labels...
specialClassMathClosure(2, 7)
