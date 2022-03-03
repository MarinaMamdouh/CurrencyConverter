//
//  CurrencyTableCellView.swift
//  SpringCardProject
//
//  Created by Marina on 28/02/2022.
//

import Foundation
import UIKit

class CurrencyTableCellView:UITableViewCell{
    
    
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    private var currency:Currency!
    
    // set the currency cell labels with currencyobject values
    func setCurrency(c:Currency){
        currency = c
        currencyLabel.text =  c.symbol
        // get the date formatted with our app format
        dateLabel.text = c.date.getOurDate()
        rateLabel.text =  c.rate.toString
    }
    
    
}
