/*:
 # Structures
 To address a question: “I have fahrenheit and I want to initialize a Temperature instance with that value. How do I do it?”


 **Technical detail:** This code uses an extension for the custom initializer to preserve the memberwise initializers. If we had defined the custom initializer in the main Temperature definition, we would have had to also implement a custom `init(celsius:Double)` initializer.

 We've also implemented the get and set variation of the computed property, to allow people to set the fahrenheit value of our Temperature after it has been initialized.
 
**Challenge:** We repeat the conversion code from fahrenheit to celsius twice... how could we improve this code?
*/
import Foundation

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



/*:
 # Enumerations

 There are localizable ways to present location information, but this example might be interesting if you want to be able to refer to a city consistently throughout your code (and also use computed properties to return the official name as well as aliases the city may be known by)

 In Ireland, as well as Kazakhstan, cities might be known by a number of names (or misspellings of that name). In order to not have the following two **not** equal the same place, we might use an enumeration to provide a bit of clarity:
 ```
 let myTown = "Dun Laoghaire
 let myKidsTown = "Dunleary"
 if myTown == myKidsTown {
     print("We live in the same town.")
 }
 ```

 If we use the enumeration below, we could assign each the value of `City.dunLaoghaire` and they would be the same.
 
 **Challenge:** Implement a method on the City enumeration that would allow you to accept strings and turn them into the right case, no matter the alternative spelling or reference.
*/

enum City {
    case almaty
    case dunLaoghaire
    
    var canonicalName: String {
        switch self {
            
        case .almaty:
            return "Almaty"
        case .dunLaoghaire:
            return "Dún Laoghaire"
        }
    }
    
    var alsoKnownAs: [String] {
        switch self {
        case .almaty:
            return ["Алматы", "Alma-Ata", "Алма-Ата", "Almatau", "Apple Mountain"]
        case .dunLaoghaire:
            return ["Dun Laoghaire", "Dunleary", "Glenageary", "Kingstown", "Dún Laoire"]
        }
    }
}

let myTown: City = .dunLaoghaire
print(myTown.canonicalName)
