//
//  ViewController.swift
//  SpringCardProject
//
//  Created by Marina on 28/02/2022.
//

import UIKit

class MainViewController: UITableViewController {
    private var currencies:[Currency] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getCurrencies()
        self.view.backgroundColor =  UIColor(named: Constants.BACKGROUND_COLOR_NAME)
        
    }
    
    func getCurrencies(){
        NetworkManager.networkManager.getCurriencesRate(completionHandler: { curr, error in
            guard let e = error else{
                currencies =  curr
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
        let cell = self.tableView.dequeueReusableCell(withIdentifier: Constants.CURRENCY_CELL_VIEW_ID) as! CurrencyTableCellView
        cell.setCurrency(c: currencies[indexPath.row])
        return cell
    }
    


}

