//
//  Date+Extension.swift
//  SpringCardProject
//
//  Created by Marina on 28/02/2022.
//

import Foundation

extension Date{
    
    //get string with date formatted with our APP preset date format in constants
    func getDateIn(format:String)->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }


}
