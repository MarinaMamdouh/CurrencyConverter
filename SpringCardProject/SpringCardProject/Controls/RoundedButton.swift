//
//  RoundedButton.swift
//  SpringCardProject
//
//  Created by Marina on 02/03/2022.
//

import UIKit

class RoundedButton: UIButton{
    
    @IBInspectable var cornerRadius:CGFloat = 0
    
    // effect makes button responds to clicking by changing the backgroundcolor for a 0.1 time
    override open var isHighlighted: Bool {
             didSet {
                 self.highlight(withColor: .lightGray, forTime: 0.1)
             }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        // if no corner radius value then make it perfect rounded
        if cornerRadius == 0{
            cornerRadius =  rect.height / 2
        }
        // make the edges rounded by the given radius
        self.layer.cornerRadius =  cornerRadius
        self.layer.masksToBounds = true
    }
}
