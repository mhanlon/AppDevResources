///
/// Some code samples for the February 8th-11th T3
///

/// Showing off order of operations
let x = 4
let y = 9
var z = 4 * y + 6
//var

/// Showing off the behavior of a switch when we have multiple potential matching cases...
switch x {
case 1...5:
    print("We have a range of numbers...")
case 4:
    print("4!")
default:
    print("No match!")
}

/// Switching on strings...
let myName = "Áine"
switch myName {
case "Bob":
    print("Bob is it.")
case "Matt":
    print("Your name is Matt.")
case "Áine":
    print("Your name is Áine")
default:
    print("no name match")
}


// Functions
/// The order of parameters is important
func tryMe(firstNumber: Int, secondNumber: Int) {
    print("\(firstNumber) - \(secondNumber)")
}

tryMe(firstNumber: 9, secondNumber: 8)
/// Uncomment the following to see the compiler error when you try to specify parameters in the wrong order
//tryMe(secondNumber: 7, firstNumber: 1)


/// Showing off property observers and using customized old and new vallue property names
struct StepCounter {
    var numberOfSteps: Int = 0
    {
        willSet(newNumberOfSteps) {
            print("Setting the steps to... \(newNumberOfSteps)")
        }
//        didSet(oldNumberOfSteps) {
        didSet {
            /// By default our 'oldValue' in this property observer is `oldValue`
            print("Our old number of steps was \(oldValue)")
            /// Uncomment the `didSet` implementation above and this line below to see our
            /// own defined version of the 'oldValue' property in action
//            print("Our old number of steps was \(oldNumberOfSteps)")
        }
    }
}

var counter = StepCounter(numberOfSteps: 0)
counter.numberOfSteps = 1
counter.numberOfSteps = 10

/// type(of:) function from the Scope lesson from Yannis... this is a great additional tool to show to students
/// Uncomment the line below and option-click on the function name to see more info about this great tool for inspecting your types
//type(of: T)
type(of: counter)
