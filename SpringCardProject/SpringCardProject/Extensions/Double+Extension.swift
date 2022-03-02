//
//  Int+Extension.swift
//  SpringCardProject
//
//  Created by Marina on 02/03/2022.
//

import Foundation

extension Double {
    func formatToMoney()->String{
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.currencySymbol = ""

        // We'll force unwrap with the !, if you've got defined data you may need more error checking

        let numberFormated = currencyFormatter.string(from: NSNumber(value: self))!
       return numberFormated
    }
}
