import Foundation
/// This playground is for groups that might be teaching students coming from C or other programming languages and will have a certain type of question comparing Swift with those languages.

/// **Collections:**
/// With regards to using type annotation to limit an array's contents, try adding a value in this array of 128 or greater... What happens?
/// Why might we want an array of numbers just limited to a certain range of numbers?
var numbers: [Int8] = [127, 1, -127]

/// ** Operators:**
/// Can we downcast `Double`s to `Int`s? In the slides we have an example of casting an `Int` to a `Double`...
var hello = 1.9
print(Int(hello))

/// This will fail to compile because Swift only allows boolean statements with the logical AND operator
//var result = 1 && 2
/// We *do* have bitwise operators, too, of course... and range operators, too!
var bitwiseResult = 1 & 1
let range = 1...3 // Note the type in the preview pane!


/// **Control Flow:**
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


/// **Strings:**
///  One interesting aspect of Swift and how it treats unicode characters with the count property is that `.count` will return the number of characters you visually see, not how much space it takes up in memory.
///  Compare the emoji vs a string with just one character.
///  Or vs an emoji composed of more than one emoji!
let indianFlag = "🇮🇳"
let iVowel = "I"
let complexEmoji = "👨‍👩‍👧"
print(indianFlag.count)
print(indianFlag.utf8.count)
print(iVowel.count)
print(iVowel.utf8.count)
print(complexEmoji.count)
print(complexEmoji.utf8.count)


/// **Constants, Variables, & Data Types:**
/// Our slide that introduces types shows a `struct` keyword. How is this different than C-structs?
/// A C struct is a primitive type, whereas Swift Structures have a lot more functionality and are more like classes from comparable languages. Send your students to https://docs.swift.org/swift-book/documentation/the-swift-programming-language/classesandstructures/ for a more in-depth look.


/// **Guard**
/// The question was "can we use guard statement outside of any function?"
/// Uncomment the following code to try it out

//guard let code = responseCode else {
    // Must throw or return here... but we have no scope from which we can return...
//}

