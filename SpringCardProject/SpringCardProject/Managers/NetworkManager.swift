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
    
    // get the Current currencies Rate from API
    func getCurriencesRate(completionHandler:@escaping([Currency] , Error?)-> Void){
        
        // construct URL string e.g: "https://openexchangerates.org/api/latest.json?app_id=YOUR_APP_ID"
        let apiURL = "\(Constants.API.API_URL)" +
                     "\(Constants.API.LatestCurrencies.ENDPOINT)?" +
                     "\(Constants.API.LatestCurrencies.PARAM_APP_ID_NAME)=" +
                     Constants.API.API_KEY
        
        // Validate the URL
        guard let url = URL(string: apiURL) else{
            print("URL provided is not Valid")
            // send completion handler with empty list and API Error
            completionHandler([],Errors.ApiError)
            return
        }
        // 2- Create Session
        let session = URLSession(configuration: .default)
        // 3- Create Task for the session
        let task = session.dataTask(with: url) { data, response, error in
            if let e = error {
                // API returns error
                print(e)
                // send completion handler with empty list and API Error
                completionHandler([], Errors.ApiError)
                return
            }
            // data is found and no error
            if let mydata = data {
                do{
                    // try parsing the data by jsonManager to CurrencyData object
                    let jsonCurrencies = try JsonManager.jsonManager.parse(data: mydata, toType: CurrencyData.self)
                    
                    // get currencies list from currencyData
                    let currencies = jsonCurrencies.getCurrencies()
                    // send completion handler with currency list and no error
                    completionHandler(currencies,nil)
                    
                }
                // catch the exception if something wrong happened while json parsing
                catch{
                    print(error)
                    // send completion handler with empty list and parsing error
                    completionHandler([], Errors.ParsingDataError)
                }
            
            }
        }
        
        // 4- Start the Task
        task.resume()
        
    }
     
}
