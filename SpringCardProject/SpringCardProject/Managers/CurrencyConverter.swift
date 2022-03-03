//
//  CurrencyConverter.swift
//  SpringCardProject
//
//  Created by Marina on 02/03/2022.
//

import Foundation

class CurrencyConverter{
    static let instance = CurrencyConverter()
    
    // convert the givin amount(US dollars) to given currency e.g. Egyptian pounds
    func convert(amountInUSD amount:Int ,toCurrency c:Currency)->Double{
        // USD Aamount multiply the currency rate
        // e.g. amount in us dollars = 1000$ &  1 Egyptian Pound rate = 16
        // then the amount in egyptian pounds = 1000$ * 16 = 16,000
        let result  =  Double(amount) * c.rate
        return result
    }
}
