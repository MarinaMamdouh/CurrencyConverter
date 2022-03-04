//
//  CurrencyConverterViewController.swift
//  SpringCardProject
//
//  Created by Marina on 01/03/2022.
//

import UIKit


class CurrencyConverterViewController: UIViewController{
    
    //////// OUTLETS ////////
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var amountDollarsTextField: UITextField!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var convertButton: RoundedButton!
    
    @IBOutlet weak var containerStackView: UIStackView!
    
    //////// PROPERTIES /////////
    var currency:Currency!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // setup the navigationBar and Controls initialValues
        // then calculate the initial amount
        // add entry animation to the whole View
        self.drawNavigationBar()
        self.setControlsInitialValues()
        self.calculateTotalAmount()
        containerStackView.entryAnimation()
        self.convertButton.setTitleColor(UIColor.red, for: .selected)
    }

    
}

////// MARK: - Outlets Actions Methods
extension CurrencyConverterViewController{
    
    @IBAction func convertBtnClicked(_ sender: Any) {
        // when convert button is clicked then calculate total amount based on current values
        self.calculateTotalAmount()
        
    }
    
    @IBAction func amountTextFieldEdidingChanged(_ sender: Any) {
        // make sure there is $ symbol while entering the value
        if amountDollarsTextField.text?.first != "$"{
            amountDollarsTextField.text = "$\(amountDollarsTextField.text ?? "")"
        }
    }
}


///// MARK: - Helper Methods
extension CurrencyConverterViewController {
    
    private func calculateTotalAmount(){
        var amountInDollarsString = amountDollarsTextField.text
        // get the amount in USD from textfield but remove the $ from it to get only the number to convert to Integer
        amountInDollarsString?.removeFirst()
        // check of the validaty of amount( if it is numeric )
        guard let amountInDollars =  Int(amountInDollarsString!) else{
            // show alert with invalid amount message
            self.showBasicAlert(with: Constants.UI.Texts.ALERT_INVALID_AMOUNT_TITLE, message: Constants.UI.Texts.ALERT_INVALID_AMOUNT_MESSAGE,
                cancelButton: Constants.UI.Texts.ALERT_OK_BUTTON)
            return
        }
        // use the CUrrencyCOnverter to convert the amount to our given currency
        let convertedAmount = CurrencyConverter.instance.convert(amountInUSD: amountInDollars, toCurrency: currency)
        // format the converted amount to money format e.g. 3100 to 3,100
        let convertedAmountFormated =  convertedAmount.toMoney
        totalAmountLabel.text =  convertedAmountFormated
    }
    
    // setup the navigation bar
    private func drawNavigationBar(){
        // set the title to the currency symbol e.g. AED
        self.title = currency.symbol
    }
    
    // setup the initialValues of the controls
    private func setControlsInitialValues(){
        // e.g. Symbol: "AED"
        // e.g. rate : 17.01
        // e.g. totalAmount = calculation based on the initial values
        // e.g. amount in usd is pre-set in app constants like $1 to start with
        symbolLabel.text =  currency.symbol
        rateLabel.text = "\(currency.rate)"
        totalAmountLabel.text = "\(currency.rate)"
        amountDollarsTextField.text = "$\(Constants.USD_AMOUNT_INITIAL_VALUE)"
    }

    
}
