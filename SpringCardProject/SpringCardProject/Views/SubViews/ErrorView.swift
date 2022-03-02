//
//  ErrorView.swift
//  SpringCardProject
//
//  Created by Marina on 02/03/2022.
//

import UIKit

protocol ErrorViewDelegate{
    func didClickTryAgain()
}

class ErrorView: UIView{
    
    var delegate:ErrorViewDelegate!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    
    @IBAction func tryAgainButtonClicked(_ sender: Any) {
        
        delegate.didClickTryAgain()
        
    }
}
