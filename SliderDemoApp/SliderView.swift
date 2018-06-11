//
//  SliderView.swift
//  SliderDemoApp
//
//  Created by Inkswipe on 6/11/18.
//  Copyright © 2018 Fortune4 Technologies. All rights reserved.
//

import UIKit

class SliderView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBOutlet weak var yourHereLbl: UILabel!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var yourHereleading: NSLayoutConstraint!
    //@IBOutlet weak var sliderBackView: UIView!
    @IBOutlet weak var leading: NSLayoutConstraint!
    @IBOutlet weak var sliderBtn: UIButton!
    @IBOutlet weak var sliderView: UIView!
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: self)
            print(position)
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        
        if let touch = touches.first {
            
            let position = touch.location(in: self)
            print(position)
            if position.x >= -10.0 && position.x <= (self.frame.size.width-10)
            {
                if position.x >= 90.0 &&  position.x <= (self.frame.size.width-90.0)
                {
                    self.yourHereleading.constant = -35
                }
                else
                    if position.x >= (self.frame.size.width-90.0)
                    {
                        self.yourHereleading.constant = -70
                    }
                    else
                    {
                        self.yourHereleading.constant = 0
                }
                
//                if position.x >= 0.0
//                {
//                    let totalWidth = self.frame.size.width-13
//                    let percentage = position.x/totalWidth*100
//                    //self.percentageLbl.text = "\(Int(percentage))%"
//                }
//
                self.leading.constant = position.x
                self.widthConstraint.constant = position.x+5
                
            }
        }
        
        
    }
    func setSlider(percentage:Int)
    {
        
        let totalWidth = self.frame.size.width-13
        let x = CGFloat(percentage) * totalWidth / 100
        let position = CGPoint(x:x , y: 0)
        if position.x >= -10.0 && position.x <= (self.frame.size.width-10)
        {
            if position.x >= 90.0 &&  position.x <= (self.frame.size.width-90.0)
            {
                
                self.yourHereleading.constant = -35
            }
            else
                if position.x >= (self.frame.size.width-90.0)
                {
                    self.yourHereleading.constant = -70
                }
                else
                {
                    self.yourHereleading.constant = 0
            }
            
//            if position.x >= 0.0
//            {
//                let totalWidth = self.frame.size.width-13
//                let percentage = position.x/totalWidth*100
//                //self.percentageLbl.text = "\(Int(percentage))%"
//            }
            
            self.leading.constant = position.x
            self.widthConstraint.constant = position.x+5
            
        }
    }

}
