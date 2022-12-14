import Foundation

///To address a question: “I have fahrenheit and I want to initialize a Temperature instance with that value. How do I do it?”
///
///Technical detail: This code uses an extension for the custom initializer to preserve the memberwise initializers. If we had defined the custom initializer in the main Temperature definition, we would have had to also implement a custom init(celsius:Double) initializer.

struct Temperature {
    var celsius: Double

    var fahrenheit: Double {
        celsius * 1.8 + 32
    }
}

extension Temperature {
    init(fahrenheit: Double) {
        self.celsius = (fahrenheit - 32) / 1.8
    }
}
let temp = Temperature(fahrenheit: 32)
print(temp)
print(temp.fahrenheit)
