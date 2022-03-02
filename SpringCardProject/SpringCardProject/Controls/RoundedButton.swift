//
//  RoundedButton.swift
//  SpringCardProject
//
//  Created by Marina on 02/03/2022.
//

import UIKit

class RoundedButton: UIButton{
    @IBInspectable var cornerRadius:CGFloat = 0
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        if cornerRadius == 0{
            cornerRadius =  rect.height / 2
        }
        self.layer.cornerRadius =  cornerRadius
        self.layer.masksToBounds = true
    }
}
