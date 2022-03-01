//
//  Errors.swift
//  SpringCardProject
//
//  Created by Marina on 01/03/2022.
//

import Foundation

enum Errors: Error{
    
    case ApiError
    case ParsingDataError
    case NetworkError

}

extension Errors : LocalizedError {
    var errorDescription: String? {
           switch self {
           case .ApiError:
               return NSLocalizedString(
                   Constants.ErrorMessages.API_ERROR,
                   comment: ""
               )
           case .ParsingDataError:
               return NSLocalizedString(
                   Constants.ErrorMessages.PARSING_DATA_ERROR,
                   comment: ""
               )
           case .NetworkError:
               return NSLocalizedString(
                   Constants.ErrorMessages.NETWORK_ERROR,
                   comment: ""
               )

           }
       }
}


