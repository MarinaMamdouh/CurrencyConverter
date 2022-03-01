//
//  ViewController.swift
//  SpringCardProject
//
//  Created by Marina on 28/02/2022.
//

import UIKit

class MainViewController: UITableViewController {

    private var currencies:[Currency] = []
    private var selectedCurrency:Currency!
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        navigationController?.navigationBar.backgroundColor = UIColor(named: Constants.UI.BACKGROUND_COLOR_NAME)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getCurrencies()
        //self.view.backgroundColor =  UIColor(named: Constants.UI.BACKGROUND_COLOR_NAME)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == Constants.UI.CURRENCY_CONVERTER_SEGUE){
            if let nextViewController = segue.destination as? CurrencyConverterViewController {
                nextViewController.currency = selectedCurrency
                let backItem = UIBarButtonItem()
                backItem.title = ""
                backItem.tintColor = .black
                navigationItem.backBarButtonItem = backItem
            }
        }
    }
    
    func getCurrencies(){
        NetworkManager.networkManager.getCurriencesRate(completionHandler: { curr, error in
            guard let e = error else{
                self.currencies =  curr
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                return
            }
            // Display error Message
            print("Error in getting Currencies from Server " + e.localizedDescription)
        })
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: Constants.UI.CURRENCY_CELL_VIEW_ID) as! CurrencyTableCellView
        cell.setCurrency(c: currencies[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCurrency =  currencies[indexPath.row]
        performSegue(withIdentifier: Constants.UI.CURRENCY_CONVERTER_SEGUE, sender: nil)
    }
    


}

