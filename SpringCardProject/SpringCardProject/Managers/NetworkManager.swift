//
//  NetworkManager.swift
//  SpringCardProject
//
//  Created by Marina on 28/02/2022.
//  Network Manager is a class that handles all things about network and APIs

import Foundation

class NetworkManager{
    // singleton instance of NetworkManager
    static let networkManager = NetworkManager()
    
    // get the Current currencies Rate
    func getCurriencesRate(completionHandler:@escaping([Currency] , Error?)-> Void){
        // construct URL string e.g: "https://openexchangerates.org/api/latest.json?app_id=YOUR_APP_ID"
        let apiURL = "\(Constants.API.API_URL)" +
                     "\(Constants.API.LatestCurrencies.ENDPOINT)?" +
                     "\(Constants.API.LatestCurrencies.PARAM_APP_ID_NAME)=" +
                     Constants.API.API_KEY
        
        // Validate the URL
        guard let url = URL(string: apiURL) else{
            print("URL provided is not Valid")
            completionHandler([],Errors.ApiError)
            return
        }
        // 2- Create Session
        let session = URLSession(configuration: .default)
        // 3- Create Task for the session
        let task = session.dataTask(with: url) { data, response, error in
            if let _ = error {
                
                completionHandler([], Errors.NetworkError)
                return
            }
            
            if let mydata = data {
                do{
                    //let parsedData = try JsonManager.jsonManager.parse(data: mydata, to: CurrencyData.self)
                    let decoder = JSONDecoder()
                    let jsonCurrencies = try decoder.decode(CurrencyData.self, from: mydata)
                        let currencies = jsonCurrencies.getCurrencies()
                        completionHandler(currencies,nil)
//                    if let currencies = parsedData?.getCurrencies(){
//                        completionHandler(currencies,nil)
//                    }
                    
                }
                catch{
                    print(error)
                    completionHandler([], Errors.ParsingDataError)
                }
            
            }
        }
        
        // 4- Start the Task
        task.resume()
        
//        //// testing UI with custom data
//        let c1 =  Currency(symbol: "AED", rate: 3.67891, date: Date.now)
//        let c2 =  Currency(symbol: "AFN", rate: 70.078956, date: Date.now)
//        let c3 = Currency(symbol: "ALL", rate: 104.65, date: Date.now)
//        completionHandler([c1,c2,c3], nil)
    }
     
}
