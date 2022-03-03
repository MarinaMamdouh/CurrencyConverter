//
//  Currency.swift
//  SpringCardProject
//
//  Created by Marina on 28/02/2022.
//  Model represents the data properties of Currency

import Foundation


struct Currency{
    var symbol:String
    var rate:Double
    var date:Date
    
}


struct CurrencyData:Codable{
    var timestamp:Int
    var rates:[String:Double]
    
    // export the currencies list from the DataModel
    func getCurrencies()->[Currency]{
        var currencies:[Currency] = []
        let date = Date()
        // sort the currencuies symbols alphibaticaly A-Z
        let ratesKeys =  rates.keys.sorted()
        for key in ratesKeys{
            // create a new instance of currency with the given data( symbol , rate , date)
            let currency = Currency(symbol: key, rate: rates[key]!, date: date)
            currencies.append(currency)
        }
        return currencies
    }
}




