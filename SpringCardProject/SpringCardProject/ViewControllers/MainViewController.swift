//
//  ViewController.swift
//  SpringCardProject
//
//  Created by Marina on 28/02/2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var errorView: ErrorView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var loadingIndicator: CircleLoadingIndicator!
    private var currencies:[Currency] = []
    private var selectedCurrency:Currency!
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        navigationController?.navigationBar.backgroundColor = UIColor(named: Constants.UI.BACKGROUND_COLOR_NAME)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate =  self
        tableView.dataSource =  self
        errorView.delegate =  self
        self.showLoadingIndicator()
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(reloadCurrencies), userInfo: nil, repeats: false)
        
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
    


}

////// MARK: - TableView Delegate Methods
extension MainViewController: UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: Constants.UI.CURRENCY_CELL_VIEW_ID) as! CurrencyTableCellView
        cell.setCurrency(c: currencies[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCurrency =  currencies[indexPath.row]
        performSegue(withIdentifier: Constants.UI.CURRENCY_CONVERTER_SEGUE, sender: nil)
    }
    
    

    
}

////// MARK: - Helper Methods
extension MainViewController{
    
    @objc private func reloadCurrencies(){
        NetworkManager.networkManager.getCurriencesRate(completionHandler: { curr, error in
            // go to the main thread to update UI
            DispatchQueue.main.async {
                guard let e = error else{
                    self.currencies =  curr
                    self.tableView.reloadData()
                    self.showTable()
                    return
                }
                // Display error Message
                print("Error in getting Currencies from Server " + e.localizedDescription)
                //errorView.errorMessage = e.localizedDescription
                self.showErrorView()
            }
        })
        
        
    }
    
    private func showTable(){
        tableView.isHidden = false
        errorView.isHidden =  true
        loadingIndicator.isHidden =  true
        loadingIndicator.stopAnimation()
    }
    
    private func showErrorView(){
        tableView.isHidden = true
        errorView.isHidden =  false
        loadingIndicator.isHidden = true
        loadingIndicator.stopAnimation()
    }
    
    private func showLoadingIndicator(){
        loadingIndicator.isHidden =  false
        tableView.isHidden = true
        errorView.isHidden =  true
        loadingIndicator.animate()
        
    }
    
    
    
}

////// MARK: - ErrorView Delegate Methods
extension MainViewController: ErrorViewDelegate{
    
    func didClickTryAgain() {
        showLoadingIndicator()
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(reloadCurrencies), userInfo: nil, repeats: false)
    }
    

}




