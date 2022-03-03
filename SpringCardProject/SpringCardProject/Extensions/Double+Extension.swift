//
//  Int+Extension.swift
//  SpringCardProject
//
//  Created by Marina on 02/03/2022.
//

import Foundation

extension Double {
    
    // convert given double to money format e.g. 3100.0 to 3,100
    public var toMoney:String{
        // initiate currency formatter with no pre defined symbol and with grouping (,)
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.currencySymbol = ""
        
        // convert the double number to string using this formatter
        let numberFormated = currencyFormatter.string(from: NSNumber(value: self))!
        // remove if there any extra 0 or .
       return removeExtraZeros(from: numberFormated)
    }
    
    // convert given double to string in exact form without rounding and also if it is an integer e.g 1.0 it will remove the decimal part to be 1
    public var toString:String{
        let formattedValue = String(format: "%f", self)

        return removeExtraZeros(from: formattedValue)
    }
    
    // remove extra zeros and . from double in string format
    // e.g 1.0 to 1   or 2.120000 to 2.12
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
