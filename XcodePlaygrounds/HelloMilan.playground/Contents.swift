import UIKit
/// This playground illustrates some of the questions that came up in the Milan
/// App Development with Swift Teacher Workshop, February, 2020
var str = "Hello, playground"
print(str)

/////////////////////////////////////////
// Division with Ints vs division with Doubles
let doubleResult = (51.0 / 4.0)
let intResult = (51 / 4)



/////////////////////////////////////////
// An example of incrementing an Int
var n = 1
n += 1


/////////////////////////////////////////
// An example of an open range
let range = ...6



/////////////////////////////////////////
// How to format a decimal number to two digits
let pi = 3.14159
let piTwoDigits = String(format:"%.2f", pi)
print(piTwoDigits)



/////////////////////////////////////////
// An example of a simple struct and how it behaves when an
// instance is assigned to a constant
struct Person {
    var name: String
}

let person = Person(name: "Áine")
print(person.name)
// Uncomment the following line to see if we're allowed to change the name property on our Person instance
//person.name = "Dylan"



/////////////////////////////////////////
// This struct is an example of using a failable initializer
// to create a structure which will represent a date by an
// Int, 1...12
struct Month {
    var monthNumber: Int
    
    init?(monthNumber: Int) {
        switch monthNumber {
        case 1...12:
            self.monthNumber = monthNumber
        default:
            return nil // If the number passed in the initializer
                       // isn't in the range 1-12, don't
                       // create a Month instance
        }
    }
}

let january = Month(monthNumber: 1)
let decebruary = Month(monthNumber: 18)



/////////////////////////////////////////
// An exercise from Unit 2, Lesson 3: App Development with Swift
struct Temperature {
  let celsius: Double

  var fahrenheit: Double {
    return celsius * 1.8 + 32
  }
  // Add a computed property for kelvin
  // Hint: Kelvin is celsius + 273.15
}



/////////////////////////////////////////
// An example of string concatenation using '+' signs
print("Hello " + str + " world")
// Uncomment the next two lines to see what happens when we
// try to concatenate two strings with an Int
//let integerToAddToString = 9
//print("Hello" + integerToAddToString + " world")

/////////////////////////////////////////
// An example of a class using computed properties
class Student {
    var name: String
    // Our expertise level will be the number of characters in a student's name
    var expertiseLevel: Int {
        return name.count
    }
    
    init(name: String) {
        self.name = name
    }
}

let student = Student(name: "Leonardo")
print(student.expertiseLevel)
let student2 = Student(name: "Matt")
print(student2.expertiseLevel)
