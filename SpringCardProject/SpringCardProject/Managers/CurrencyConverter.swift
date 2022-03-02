//
//  CurrencyConverter.swift
//  SpringCardProject
//
//  Created by Marina on 02/03/2022.
//

import Foundation

class CurrencyConverter{
    static let instance = CurrencyConverter()
    
    func convert(amountInUSD amount:Int ,toCurrency c:Currency)->Double{
        let result  =  Double(amount) * c.rate
        return result
    }
}
