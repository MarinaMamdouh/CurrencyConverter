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
    static let USD_AMOUNT_INITIAL_VALUE = 1
    
    ///// API Constants//////
    struct API{
        static let API_URL = "https://openexchangerates.org/api/"
        static let API_KEY = "177605c97147407da7bfa8ca7efead44"
    
        struct LatestCurrencies{
            static let ENDPOINT = "latest.json"
            static let PARAM_APP_ID_NAME = "app_id"
        }
    }
    
    //////// Error Messages Constants //////
    struct ErrorMessages{
        static let NETWORK_ERROR = "Check your internet and try again."
        static let API_ERROR = "The Problem is with our Servers Please try again."
        static let PARSING_DATA_ERROR = "Something went wrong Please try again."
    }
    
    /////// User Interface Constants /////
    struct UI{
        static let CURRENCY_CELL_VIEW_ID = "CurrencyCellView"
        static let ERROR_VIEW_NIB_NAME = "ErrorView"
        // Seques Identifiers
        static let CURRENCY_CONVERTER_SEGUE = "ShowConverter"
        static let MAIN_SCREEN_SEGUE = "main"
        /// Colors
        static let BACKGROUND_COLOR_NAME = "Background"
        static let TEXT_DARK_GRAY_COLOR = "CDarkGery"
        static let TEXT_BLACK_COLOR = "CBlack"
        static let TEXT_WHITE_COLOR = "CWhite"
        /// Animation constants
        static let ENTRY_ANIMATION_DUARATION = 0.7
        static let ENTRY_ANIMATION_DELAY = 0.2
        static let ENTRY_YSHIFT_TABLE =  150.0
        
        // texts and messages
        struct Texts{
            static let LOADING_TEXT = "Loading ..."
            static let ALERT_INVALID_AMOUNT_TITLE = "Invalid Amount"
            static let ALERT_INVALID_AMOUNT_MESSAGE = "Please enter valid amount"
            static let ALERT_OK_BUTTON = "Ok"
        }
    }
    
    

    
}
