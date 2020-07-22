/// This playground illustrates a few of the things we discussed during the T3 in Saudi Arabia (virtually) in July 2020.
///
/// Illustrating the scope of the variable inside a switch case
let temperature = 70
switch temperature {
case Int.min..<65:
    /// `tmpValue` is only accessible here in this case
    let tmpValue = Int.min
    print(tmpValue)
default:
    print("hello")
    /// tmpValue is not available here
    /// Uncomment this line and
    //print(tmpValue)
}


/// This illustrates the Swift type inference.
/// With no type annotation specified, character is initialized as a String
/// The "a", "e", &c. cases are all determined to be String types.
//let character = "z"
/// If we specify that the `character` constant is a `Character`, Swift infers
/// the "a", "e", &c. cases in our switch to be `Character`s.
let character:Character = "z"
switch character {
case "a", "e", "i", "o", "u" :
    print("I'm a vowel.")
default:
    print("\(character) is not a vowel.")
}

/// 2-01 Strings Lesson
/// The `isEmpty` property on a string is to test if the string exists but has no characters, like this:
let myString: String = ""

if myString.isEmpty {
    print("This string exists (it is initialized) but has no characters in it.")
}


/// 2-03 Structures
/// Naming a struct `Struct`
/// Not recommended, but possible.
/// You cannot name a struct `struct`, with a lowercase 's', as that's a reserved keyword.
struct Struct {
    var testVar: String
}

let myStruct = Struct(testVar: "hello")

/// If you have optional properties, you get a default empty initializer for your struct
struct MyStruct {
    var name: String?
}

let myOptionalStruct = MyStruct()


func returnSomething() -> Int {
    var counter = 0
    for i in 1...99 {
        counter = i
    }
    /// We need a return statement here because we have multiple lines in our function
    return counter
}


/// If you uncomment these next few lines, you'll get a feel for the scope of variables
/// If you keep the `import Foundation` line commented out, where we print out `index` we'll get a
/// complile error because the only `index` symbol we have defined here is in our for loop's local scope.
/// If you un-comment it there is a public global symbol deep down called `index`, so it'll print that this is a Function
//import Foundation
//let name = "Richard"
//func printTenNames() {
//    for index in 1...4 {
//        print(
//    }
//}
///
//print(index)

/// For the Unit 2, Lesson 3 Collections lesson
/// This will show that using the '+' symbol with arrays will combine their contents into one bigger array.
var newArray = [1,2,3] + [4,5,6]
print(newArray)

/// This illustrates the behavior of the `updateValue` method on dictionaries (it returns the old value, if any, for that key)
var dict = ["Bob": 30, "Karen": 19, "Josephine": 11]
let oldValue = dict.updateValue(3, forKey: "Kevin")
print(dict)


/// The `defer` statement
/// This code snippet, something you might show off during the Unit 3, Lesson 3 - guard lesson
/// shows you how the deferred code gets run and when. Follow the prints in the console to see
/// how the deferred code is always called last before

func deferMe(name: String?) {
    defer {
        print("This item was deferred. [00]\n\n")
    }
    /// Another defer block. Note when it gets executed in the console.
    defer {
        print("This item was deferred. [01]")
    }
    guard let name = name else {
        print("The name parameter was not provided with a value, so we're exiting.")
        return
    }
    print("This item was not deferred. [02]")
    for i in 3...9 {
        defer {
            print("This item, inside the loop [pass \(i)] was deferred.")
        }
        print("This is us, inside the loop. [0\(i)]")
    }
    
    print("Say my name: \"\(name)\"")
}

/// This call of the deferMe function will show you what happens when you exit with a guard statement
deferMe(name:nil)

/// This call will show you the whole execution of the function's code.
deferMe(name:"Gerald")
