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
    
    @IBOutlet weak var convertButton: RoundedButton!
    
    var currency:Currency!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.drawNavigationBar()
        self.setControlsInitialValues()
        self.calculateTotalAmount()
    }

    
}

////// MARK: - Outlets Actions Methods
extension CurrencyConverterViewController{
    
    @IBAction func convertBtnClicked(_ sender: Any) {
        
        self.calculateTotalAmount()
        
    }
    
    @IBAction func amountTextFieldEdidingChanged(_ sender: Any) {
        if amountDollarsTextField.text?.first != "$"{
            amountDollarsTextField.text = "$\(amountDollarsTextField.text ?? "")"
        }
    }
}


///// MARK: - Helper Methods
extension CurrencyConverterViewController {
    
    private func calculateTotalAmount(){
        var amountInDollarsString = amountDollarsTextField.text
        amountInDollarsString?.removeFirst()
        let amountInDollars =  Int(amountInDollarsString!)!
        let convertedAmount = CurrencyConverter.instance.convert(amountInUSD: amountInDollars, toCurrency: currency)
        
        let convertedAmountFormated =  convertedAmount.toMoney
        totalAmountLabel.text =  convertedAmountFormated
    }
    
    private func drawNavigationBar(){
        self.title = currency.symbol
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: " ", style: .plain, target: nil, action: nil)
    }
    
    private func setControlsInitialValues(){
        symbolLabel.text =  currency.symbol
        rateLabel.text = "\(currency.rate)"
        totalAmountLabel.text = "\(currency.rate)"
        amountDollarsTextField.text = "$1"
    }

    
}
