//
//  Date+Extension.swift
//  SpringCardProject
//
//  Created by Marina on 28/02/2022.
//

import Foundation

extension Date{
    
    //get string with date formatted with our APP preset date format in constants
    func getOurDate()->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Constants.DATE_FORMAT
        return dateFormatter.string(from: self)
    }


}
