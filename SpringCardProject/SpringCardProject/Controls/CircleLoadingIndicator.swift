//
//  CircleLoadingIndicator.swift
//  SpringCardProject
//
//  Created by Marina on 02/03/2022.
//

import UIKit

class CircleLoadingIndicator: UIView{
    
    private let movingCircle = CAShapeLayer()
    private let movingCircleView = UIView()
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
//        movingCircle.frame =  CGRect(x: self.frame.width/2, y: self.frame.height/2, width: 100, height: 100)
//        self.addSubview(movingCircleView)
        frame =  CGRect(x: 0, y: 0, width: 100, height: 100)
        let rect =  self.bounds
        let circularPath = UIBezierPath(ovalIn: rect)
        movingCircle.path =  circularPath.cgPath
        movingCircle.fillColor = UIColor.clear.cgColor
        movingCircle.strokeColor =  color.cgColor
        movingCircle.lineWidth =  strokeWidth
        movingCircle.strokeEnd = 0.3
        movingCircle.lineCap = .round
        self.backgroundColor = .clear
        
        self.layer.addSublayer(movingCircle)
        
    }
    
    
     func animate(){
         animationIsStopped =  false
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
