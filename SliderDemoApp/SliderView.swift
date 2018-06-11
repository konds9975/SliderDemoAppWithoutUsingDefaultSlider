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
    
    func setSlider(percentage:Int,animated:Bool?)
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
            
            if animated != nil
            {
                if animated!
                {
            
                    if timer == nil
                    {
                        self.totpercentage = percentage
                        self.percentage = percentage
                        self.startTimer()
                    }
                    else
                    {
                        self.leading.constant = position.x
                        self.widthConstraint.constant = position.x+5
                    }
                }
                else
                {
                    self.leading.constant = position.x
                    self.widthConstraint.constant = position.x+5
                }
            }
            else
            {
                self.leading.constant = position.x
                self.widthConstraint.constant = position.x+5
            }
            
            
           
          
        }
    }
    
    
    
    var timer: Timer?
    var percentage,totpercentage : Int?
    
    func startTimer() {
        
        if timer == nil {
            percentage = 0
            self.timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.loop), userInfo: nil, repeats: true)
        }
    }
    
    func stopTimer() {
        if timer != nil {
            
            timer?.invalidate()
            timer = nil
            percentage = nil
        }
    }
    
    @objc func loop() {
        
        if percentage != nil
        {
            percentage = percentage! + 1
            self.setSlider(percentage: percentage!, animated: true)
            if percentage == totpercentage
            {
                stopTimer()
            }
           
        }
        else
        {
            stopTimer()
        }
        
        
      
    }

}


