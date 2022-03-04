//
//  ViewController.swift
//  SpringCardProject
//
//  Created by Marina on 28/02/2022.
//

import UIKit

class MainViewController: UIViewController {

    /// OUTLETS ////
    @IBOutlet weak var errorView: ErrorView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadingIndicator: CircleLoadingIndicator!
    
    //// PROPERTIES /////
    private var currencies:[Currency] = []
    private var selectedCurrency:Currency!
    private let refreshControl = UIRefreshControl()
    
    //// OVERRIDE METHODS //////
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        navigationController?.navigationBar.backgroundColor = UIColor(named: Constants.UI.BACKGROUND_COLOR_NAME)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set the delegates
        tableView.delegate =  self
        tableView.dataSource =  self
        errorView.delegate =  self
        // start by showing the indcator
        self.showLoadingIndicator()
        self.setupTableRefresher()
        // Apply small time timer to show loading Indicator and then reload the table with currencies sent by the server
        // NOTE: this timer is made to represents the UI when user waits for API response usually in big data APIs take time to give response ( so in real life cases there is no timer before calling API)
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(reloadCurrencies), userInfo: nil, repeats: false)
        
    }
    
    // call a segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // if it is calling segue of Displaying Currency COnverter View Controller
        if(segue.identifier == Constants.UI.CURRENCY_CONVERTER_SEGUE){
            // check on the availability of optional CurrencyConverter View Controller
            if let nextViewController = segue.destination as? CurrencyConverterViewController {
                // pass the selected currency
                nextViewController.currency = selectedCurrency
                // adjust the navigation bar Back button to have no word and color to be black
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
        // pass the given currency to CurrencyTableCellView to set the UI Controls
        cell.setCurrency(c: currencies[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // store the selected currency to use it in another function
        selectedCurrency =  currencies[indexPath.row]
        // call the segue which displays CurrencyConverterViewController
        performSegue(withIdentifier: Constants.UI.CURRENCY_CONVERTER_SEGUE, sender: nil)
    }
    
    

    
}

////// MARK: - Helper Methods
extension MainViewController{
    
    // load or reload the tableview with currency list which will be sent by the server
    @objc private func reloadCurrencies(){
        // use the networkmanager to give us the currency list from server
        NetworkManager.networkManager.getCurriencesRate(completionHandler: { curr, error in
            // when the server gave us a response
            // go to the main thread to update the UI with data or error
            DispatchQueue.main.async {
                // check if there is no error
                guard let e = error else{
                    // store the list in our VC to use it in other methods
                    self.currencies =  curr
                    // load the tableview with the list
                    self.tableView.reloadData()
                    self.showTable()
                    self.stopTableRefresher()
                    return
                }
                // if there is an error Display error Message
                self.errorView.errorMessage = e.localizedDescription
                self.showErrorView()
            }
        })
        
        
    }
    
    // show table and hide other views
    // used when there is data needs to be displayed
    private func showTable(){
        tableView.isHidden = false
        tableView.entryAnimation(withDuration: 0.7, delay: 0.2, yShift: Constants.UI.ENTRY_YSHIFT_TABLE)
        // hide errorView and loadingIndicator
        errorView.isHidden =  true
        loadingIndicator.isHidden =  true
        loadingIndicator.stopAnimation()
    }
    
    // show ErrorView and hide others
    // used when an error needs to be displayed
    private func showErrorView(){
        errorView.isHidden =  false
        errorView.entryAnimation()
        // hide tableView and loadingIndicator
        tableView.isHidden = true
        loadingIndicator.isHidden = true
        loadingIndicator.stopAnimation()
    }
    
    // show Loading Indicator and hide others
    // used when waiting for data from server
    private func showLoadingIndicator(){
        loadingIndicator.isHidden =  false
        // hide tableView and ErrorView
        tableView.isHidden = true
        errorView.isHidden =  true
        loadingIndicator.animate()
        
        
    }
    
    private func setupTableRefresher(){
        tableView.refreshControl = refreshControl
        refreshControl.tintColor = .lightGray
        refreshControl.addTarget(self, action: #selector(reloadCurrencies), for: .valueChanged)
    }
    
    
    private func stopTableRefresher(){
        refreshControl.endRefreshing()
    }
    
    
    
}

////// MARK: - ErrorView Delegate Methods
extension MainViewController: ErrorViewDelegate{
    
    // try again button in ErrorView is Clicked
    func didClickTryAgain() {
        // show indicator while trying again loading data from server
        showLoadingIndicator()
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(reloadCurrencies), userInfo: nil, repeats: false)
    }
    

}




