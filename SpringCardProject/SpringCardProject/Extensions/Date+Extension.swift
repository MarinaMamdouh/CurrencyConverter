//
//  Date+Extension.swift
//  SpringCardProject
//
//  Created by Marina on 28/02/2022.
//

import Foundation

extension Date{
    func getOurDate()->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.DATE_FORMAT
        return dateFormatter.string(from: self)
    }
}

extension String{
    func getOurDate()->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.DATE_FORMAT

        if let date = dateFormatter.date(from: self) {
            return dateFormatter.string(from: date)
        } else {
           print("There was an error decoding the string")
            return ""
        }
    }
}
