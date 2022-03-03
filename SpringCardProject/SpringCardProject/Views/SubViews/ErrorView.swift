//
//  ErrorView.swift
//  SpringCardProject
//
//  Created by Marina on 02/03/2022.
//

import UIKit

// use this protocol when using ErrorView inside the ViewController or ParentView
protocol ErrorViewDelegate{
    // called when TryAgain button is clicked in ErrorView
    func didClickTryAgain()
}

class ErrorView: UIView{
    
    var delegate:ErrorViewDelegate!
    var errorMessage:String!
    private let nibName = Constants.UI.ERROR_VIEW_NIB_NAME
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
        // update the errorMessage label while drawing the view
        if let msg = errorMessage {
            errorMessageLabel.text = msg
        }
    }
    
    // get the design of XIB file
    private func commonInit(){
        let viewFromXib = Bundle.main.loadNibNamed(nibName, owner: self, options: nil)![0] as! UIView
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)
    
    }
    
    
    @IBAction func tryAgainButtonClicked(_ sender: Any) {
        
        delegate.didClickTryAgain()
        
    }
    

}
