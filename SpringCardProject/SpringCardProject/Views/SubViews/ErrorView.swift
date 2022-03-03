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
    var errorMessage:String!
    private let nibName = "ErrorView"
    @IBOutlet var containerView: UIView!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        if let msg = errorMessage {
            errorMessageLabel.text = msg
        }
    }
    
    private func commonInit(){
        let viewFromXib = Bundle.main.loadNibNamed(nibName, owner: self, options: nil)![0] as! UIView
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)
    
    }
    
    @IBAction func tryAgainButtonClicked(_ sender: Any) {
        
        delegate.didClickTryAgain()
        
    }
    

}
