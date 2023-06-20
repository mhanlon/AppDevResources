import UIKit

var greeting = "Hello, playground"

/// This playground is for groups that might be teaching students coming from C or other programming languages and will have a certain type of question comparing Swift with those languages.


var numbers: [Int8] = [127, 1, -127]

/// Can we downcast `Double`s to `Int`s?
var hello = 1.9
print(Int(hello))

/// This will fail to compile because Swift only allows boolean statements with the logical AND operator
//var result = 1 && 2


/// Control Flow:
/// Can you use optionals with `switch`?
var responseCode: Int? = nil

switch responseCode {
case 404:
    print("File not found")
case nil:
    print("No status")
default:
    print("Some other status")
}
