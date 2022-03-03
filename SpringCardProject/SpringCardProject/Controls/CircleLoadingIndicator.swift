//
//  CircleLoadingIndicator.swift
//  SpringCardProject
//
//  Created by Marina on 02/03/2022.
//

import UIKit

class CircleLoadingIndicator: UIView{
    
    private let movingCircle = CAShapeLayer()
    private var animationIsStopped = false
    @IBInspectable var color:UIColor = .gray
    @IBInspectable var strokeWidth:CGFloat = 10
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        drawCircle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        drawCircle()
    }
    
    private func drawCircle(){
        // assume the size of view
        frame =  CGRect(x: 0, y: 0, width: 100, height: 100)
        let rect =  self.bounds
        
        // draw the indicator
        let circularPath = UIBezierPath(ovalIn: rect)
        // draw circular path layer in the frame of the view
        movingCircle.path =  circularPath.cgPath
        // with no fill color to the inner circle
        movingCircle.fillColor = UIColor.clear.cgColor
        // make the border color of the circle = the given color
        movingCircle.strokeColor =  color.cgColor
        // make the border width of the circle = the given border width
        movingCircle.lineWidth =  strokeWidth
        // draw quarter of the circle
        movingCircle.strokeEnd = 0.25
        // make the edge of the stroke be rounded not squared
        movingCircle.lineCap = .round
        // make the main view background clear
        self.backgroundColor = .clear
        // add the quarter circle layer to the view
        self.layer.addSublayer(movingCircle)
        
    }
    
    
     func animate(){
         animationIsStopped =  false
         // animate the curve in full circlular motion from pi to 0 and vice-versa infinatly until the boolean animationIsStopped is true
        UIView.animate(withDuration: 1, delay: 0, options: .curveLinear) {
            self.transform = CGAffineTransform(rotationAngle: .pi)
        } completion: { completed in
            UIView.animate(withDuration: 1, delay: 0, options: .curveLinear) {
                self.transform = CGAffineTransform(rotationAngle: 0)
            } completion: { completed in
                if self.animationIsStopped{
                    return
                }
                
                self.animate()
            }

        }

    }
    
    func stopAnimation(){
        animationIsStopped = true
    }
}
