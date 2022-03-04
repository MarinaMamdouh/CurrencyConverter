//
//  AnimatedLaunchViewController.swift
//  SpringCardProject
//
//  Created by Marina on 04/03/2022.
//

import UIKit

class AnimatedLaunchViewController:UIViewController{
    
    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var logoLabel: UILabel!
    
    private var animationIsActive = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startAnimation()
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(goToMainViewController), userInfo: nil, repeats: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        animationIsActive =  false
    }
    
    
    func startAnimation(){
        animateLogoImage()
        animateLogoLabel()
    }

    
    private func animateLogoImage(){
        self.logoImage.center.y -= 50
        UIView.animateKeyframes(withDuration: 1, delay: 0, options:.init()) {
            self.logoImage.center.y += 50
        } completion: { sucess in
            
            UIView.animate(withDuration: 1, delay: 0, options: .init()) {
                self.logoImage.center.y -= 50
            } completion: { sucess in
                self.logoImage.center.y += 50
                if self.animationIsActive {
                    self.animateLogoImage()
                }
            }
        }
        
    }
    
    private func animateLogoLabel(){
        self.logoLabel.alpha = 0
        UIView.animate(withDuration: 1) {
            self.logoLabel.alpha = 1
        }
    }
    
    
    @objc func goToMainViewController(){
        performSegue(withIdentifier: Constants.UI.MAIN_SCREEN_SEGUE, sender: nil)
        
    }
    
}
