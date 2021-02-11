import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

/// The goal of this playground is to take the data at https://raw.githubusercontent.com/mledoze/countries/master/countries.json
/// and turn it into a nice, clean Country struct for our code to deal with.


/// The challenge is this: take that JSON object and populate the properties in this struct:


struct Country: Decodable {
    let name: countryNameStruct
//    let currencies: currenciesStruct
    let capital: [String]
    let location: [Double]
    let region: String
    
    
    
    enum CodingKeys: String, CodingKey {
        case name
//        case currencies
        case capital
        case location = "latlng"
        case region
        
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(countryNameStruct.self, forKey: CodingKeys.name)
//        currencies = try values.decode(currenciesStruct.self, forKey: .currencies)
        capital = try values.decode([String].self, forKey: CodingKeys.capital)
        location = try values.decode([Double].self, forKey: CodingKeys.location)
        region = try values.decode(String.self, forKey: CodingKeys.region)
        
        
        
    }
    
    struct countryNameStruct : Codable {
        let commonName: String
        let officialName: String
        
        enum CodingKeys: String, CodingKey {
            
            case commonName = "common"
            case officialName = "official"
            
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            commonName = try values.decode(String.self, forKey: .commonName)
            officialName = try values.decode(String.self, forKey: .officialName)
            
        }
    }
    
//    struct currenciesStruct : Codable {
//        let name: String
//        let symbol: String
//
//        enum CodingKeys: String, CodingKey {
//
//            case name
//            case symbol
//
//        }
//
//        init(from decoder: Decoder) throws {
//            let values = try decoder.container(keyedBy: CodingKeys.self)
//            name = try values.decode(String.self, forKey: .name)
//            symbol = try values.decode(String.self, forKey: .symbol)
//
//        }
//    }
    
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


