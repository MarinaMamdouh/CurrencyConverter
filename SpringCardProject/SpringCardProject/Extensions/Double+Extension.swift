//
//  Int+Extension.swift
//  SpringCardProject
//
//  Created by Marina on 02/03/2022.
//

import Foundation

extension Double {
    public var toMoney:String{
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.currencySymbol = ""

        // We'll force unwrap with the !, if you've got defined data you may need more error checking

        let numberFormated = currencyFormatter.string(from: NSNumber(value: self))!
       return removeExtraZeros(from: numberFormated)
    }
    
    public var toString:String{
        let formattedValue = String(format: "%f", self)

        return removeExtraZeros(from: formattedValue)
    }
    
    private func removeExtraZeros(from s:String)->String{
        var theString  = s
        while theString.last == "0" {
            theString.removeLast()
        }

        if theString.last == "." {
            theString.removeLast()
        }
        return theString
    }
}
