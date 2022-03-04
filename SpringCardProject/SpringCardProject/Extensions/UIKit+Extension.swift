//
//  UIView+Extension.swift
//  SpringCardProject
//
//  Created by Marina on 04/03/2022.
//

import UIKit

//// Animation Methods
extension UIView{
    
    // Default Entry Animation ( fade in and animation from top y shift )
    func entryAnimation(){
        entryAnimation(withDuration: 0.7, delay: 0.2)
    }
    
    // Entry Animation with custom param duration, delay but default y value shift
    func entryAnimation(withDuration:Double, delay:Double){
        entryAnimation(withDuration: withDuration, delay: delay, yShift: 50)
    }
    
    // Entry Animation with custom param duration, delay and y value shift
    func entryAnimation(withDuration:Double, delay:Double , yShift:Double){
        // shift the view center to the top by yshift
        self.center.y -= yShift
        // make the view fully transparent(hidden)
        self.alpha = 0
        UIView.animate(withDuration: withDuration, delay: delay, options: [.curveEaseOut, .transitionFlipFromBottom]) {
            // bring the alpha to its normal and return the view center to its original state
            self.alpha = 1
            self.center.y += yShift
        } completion: { sucess in
            
        }
    }
    
    
}


extension UIControl{
    // effect makes control responds to clicking by changing the backgroundcolor for a given time
    func highlight(withColor:UIColor, forTime:Double){
        let mainColor  =  self.backgroundColor
        if !self.isHighlighted {
            backgroundColor = withColor
            DispatchQueue.main.asyncAfter(deadline: .now() + forTime) {
                self.backgroundColor = mainColor
            }
            
        }
    }
    
}


extension UITableViewCell{
    
    // effect makes cell responds to clicking by changing the backgroundcolor for a given time
    func highlight(withColor:UIColor, forTime:Double){
        let mainColor  =  self.backgroundColor
        if !self.isHighlighted {
            backgroundColor = withColor
            DispatchQueue.main.asyncAfter(deadline: .now() + forTime) {
                self.backgroundColor = mainColor
            }
            
        }
    }
    
}


extension UIViewController{
    
    // show Alert with default style and one button to cancel it
    func showBasicAlert(with title:String , message:String , cancelButton:String){
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: cancelButton, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
