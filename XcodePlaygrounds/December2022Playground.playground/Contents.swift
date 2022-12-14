import Foundation

///To address a question: “I have fahrenheit and I want to initialize a Temperature instance with that value. How do I do it?”
///
///Technical detail: This code uses an extension for the custom initializer to preserve the memberwise initializers. If we had defined the custom initializer in the main Temperature definition, we would have had to also implement a custom init(celsius:Double) initializer.
///We've also implemented the get and set variation of the computed property, to allow people to set the fahrenheit value of our Temperature after it has been initialized.
/// **Exercise:** We repeat the conversion code from fahrenheit to celsius twice... how could we improve this code?

struct Temperature {
    var celsius: Double

    var fahrenheit: Double {
        get {
            celsius * 1.8 + 32
        }
        set {
            celsius = (newValue - 32) / 1.8
        }
    }
}

extension Temperature {
    init(fahrenheit: Double) {
        self.celsius = (fahrenheit - 32) / 1.8
    }
}
var temp = Temperature(fahrenheit: 32)
print(temp)
print(temp.fahrenheit)

temp.fahrenheit = 212
print(temp)
