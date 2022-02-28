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
    func getCurriencesRate(completionHandler:([Currency] , Error?)-> Void){
        // construct URL string e.g: "https://openexchangerates.org/api/latest.json?app_id=YOUR_APP_ID"
        let apiURL = "\(Constants.API_URL)" +
                     "\(Constants.LATEST_CURRENCIES_API_ENDPOINT)" +
                     "\(Constants.API_KEY_NAME)=" + Constants.API_KEY
        
        // Validate the URL
        guard let url = URL(string: apiURL) else{
            print("URL provided is not Valid")
            completionHandler([],NSError.init())
            return
        }
        // 2- Create Session
        let session = URLSession(configuration: .default)
        // 3- Create Task for the session
        let task = session.dataTask(with: url) { data, response, error in
            if let e = error {
               // completionHandler(nil, e)
                return
            }
            if let mydata = data {
               //completionHandler([],nil)
            }
        }
        
        // 4- Start the Task
        task.resume()
        
        //// testing UI with custom data
        let c1 =  Currency(symbol: "AED", rate: 3.67891, date: Date.now)
        let c2 =  Currency(symbol: "AFN", rate: 70.078956, date: Date.now)
        let c3 = Currency(symbol: "ALL", rate: 104.65, date: Date.now)
        completionHandler([c1,c2,c3], nil)
    }
}
