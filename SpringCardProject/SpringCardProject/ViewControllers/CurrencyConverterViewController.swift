//
//  CurrencyConverterViewController.swift
//  SpringCardProject
//
//  Created by Marina on 01/03/2022.
//

import UIKit


class CurrencyConverterViewController: UIViewController{
    
    @IBOutlet weak var symbolLabel: UILabel!
    
    @IBOutlet weak var amountDollarsTextField: UITextField!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    var currency:Currency!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = currency.symbol
        symbolLabel.text =  currency.symbol
        rateLabel.text = "\(currency.rate)"
        totalAmountLabel.text = "\(currency.rate)"
        amountDollarsTextField.text = "$1"
        
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: " ", style: .plain, target: nil, action: nil)
    }
    @IBAction func convertBtnClicked(_ sender: Any) {
    }
}
