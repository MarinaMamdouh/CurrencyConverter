//
//  Constants.swift
//  SpringCardProject
//
//  Created by Marina on 28/02/2022.
//  File that has all constants of the app

import Foundation

struct Constants {
    
    //// General Constants//////
    static let DATE_FORMAT = "MM/dd/yyyy"
    
    ///// API Constants//////
    struct API{
        static let API_URL = "https://openexchangerates.org/api/"
        static let API_KEY = "177605c97147407da7bfa8ca7efead44"
    
        struct LatestCurrencies{
            static let ENDPOINT = "latest.json"
            static let PARAM_APP_ID_NAME = "app_id"
        }
    }
    
    struct ErrorMessages{
        static let NETWORK_ERROR = "Unable to connect. Check your internet and try again."
        static let API_ERROR = "OPPS!! The Problem is with our Servers. Please try again."
        static let PARSING_DATA_ERROR = "Something wrong is Happened. Re-load "
    }
    
    /////// User Interface Constants /////
    struct UI{
        static let CURRENCY_CELL_VIEW_ID = "CurrencyCellView"
        static let BACKGROUND_COLOR_NAME = "Background"
        static let CURRENCY_CONVERTER_SEGUE = "ShowConverter"
        
    }
    
    

    
}
