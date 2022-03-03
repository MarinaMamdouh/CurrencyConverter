//
//  JsonManager.swift
//  SpringCardProject
//
//  Created by Marina on 01/03/2022.
//

import Foundation

class JsonManager{
    
    // singleton instance of JsonManager
    static let jsonManager = JsonManager()
    
    // parse retrieved data to any Codable Type and return instance of that type
    // or if there is a problem while parsing throws error
    func parse<T>( data: Data, toType:T.Type) throws -> T where T : Codable{
        let decoder = JSONDecoder()
        let jsonObjects = try decoder.decode(toType, from: data)
        return jsonObjects
    }
    
}
