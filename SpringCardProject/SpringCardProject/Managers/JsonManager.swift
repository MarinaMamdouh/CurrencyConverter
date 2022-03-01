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
    // or if there is a problem while parsing throws error and returns nil
    func parse<T>( data: Data, to:T.Type) throws -> T? where T : Codable{
        let decoder = JSONDecoder()
        if let jsonCurrencies = try? decoder.decode(to, from: data){
            return jsonCurrencies
        }
        return nil
    }
    
}
