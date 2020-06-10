import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

/// The goal of this playground is to take the data at https://raw.githubusercontent.com/mledoze/countries/master/countries.json
/// and turn it into a nice, clean Country struct for our code to deal with.


/// The challenge is this: take that JSON object and populate the properties in this struct:
struct Country: Decodable {
    let name: String
    let capital: String
    let location: [Double]

    /// Hint: You'll need to add a CodingKeys enum to our Country struct that
    /// looks something like this:
    //      enum CodingKeys: String, CodingKey {
    //          case name
    //          ...

    /// Hint: You'll also need to implement a custom decode initializer like this:
    //      init(from decoder: Decoder) throws
    
    /// Hint: Use the container for the object you're parsing to pull data out and put it in our properties,
    //      let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    /// Hint: To access the official country name you may need a custom struct inside this struct
    /// to parse that object from the file.

}



// You'll also need to implemente

// Hint: The code below here shouldn't change.

// Load our countries JSON file
if let url = URL(string:"https://raw.githubusercontent.com/mledoze/countries/master/countries.json") {

    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        let decoder = JSONDecoder()
        if let data = data {
            if let countries = try? decoder.decode([Country].self, from: data) {
                print(countries)
            }
        }
    }
    // 100% if your URL isn't loading you've likely forgotten to resume the data task!
    task.resume()
}


