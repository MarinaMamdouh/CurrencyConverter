//
//  CircleLoadingIndicator.swift
//  SpringCardProject
//
//  Created by Marina on 02/03/2022.
//

import UIKit

class CircleLoadingIndicator: UIView{
    
    private let movingCircle = CAShapeLayer()
    @IBInspectable var color:UIColor = .gray
    @IBInspectable var strokeWidth:CGFloat = 10
    override init(frame: CGRect) {
        super.init(frame: frame)
        drawCircle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func drawCircle(){
        frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let rect =  self.bounds
        let circularPath = UIBezierPath(ovalIn: rect)
        movingCircle.path =  circularPath.cgPath
        movingCircle.fillColor = UIColor.clear.cgColor
        movingCircle.strokeColor =  color.cgColor
        movingCircle.lineWidth =  strokeWidth
        movingCircle.strokeEnd = 0.25
        movingCircle.lineCap = .round
        
        self.layer.addSublayer(movingCircle)
        
    }
    
    
     func animate(){
        UIView.animate(withDuration: 1, delay: 0, options: .curveLinear) {
            self.transform = CGAffineTransform(rotationAngle: .pi)
        } completion: { completed in
            UIView.animate(withDuration: 1, delay: 0, options: .curveLinear) {
                self.transform = CGAffineTransform(rotationAngle: 0)
            } completion: { completed in
                self.animate()
            }

        }

    }
}
