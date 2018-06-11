//
//  ViewController.swift
//  SliderDemoApp
//
//  Created by Inkswipe on 6/11/18.
//  Copyright © 2018 Fortune4 Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var percentageLbl: UILabel!
    @IBOutlet weak var yourHereLbl: UILabel!
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var yourHereleading: NSLayoutConstraint!
    @IBOutlet weak var sliderBackView: UIView!
    @IBOutlet weak var leading: NSLayoutConstraint!
    @IBOutlet weak var sliderBtn: UIButton!
    @IBOutlet weak var sliderView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setSlider(percentage: 50)
       
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let position = touch.location(in: view)
            print(position)
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
       
        if let touch = touches.first {
            let position = touch.location(in: self.sliderBackView)
            print(position)
            if position.x >= -10.0 && position.x <= (self.sliderBackView.frame.size.width-10)
            {
                if position.x >= 90.0 &&  position.x <= (self.sliderBackView.frame.size.width-90.0)
                {
                    self.yourHereleading.constant = -35
                }
                else
                if position.x >= (self.sliderBackView.frame.size.width-90.0)
                {
                    self.yourHereleading.constant = -70
                }
                else
                {
                    self.yourHereleading.constant = 0
                }
                
                if position.x >= 0.0
                {
                    let totalWidth = self.sliderBackView.frame.size.width-13
                    let percentage = position.x/totalWidth*100
                    self.percentageLbl.text = "\(Int(percentage))%"
                }
                
                self.leading.constant = position.x
                self.widthConstraint.constant = position.x+5
                
            }
        }
        
        
    }
    func setSlider(percentage:Int)
    {
        
            let totalWidth = self.sliderBackView.frame.size.width-13
            let x = CGFloat(percentage) * totalWidth / 100
            let position = CGPoint(x:x , y: 0)
            if position.x >= -10.0 && position.x <= (self.sliderBackView.frame.size.width-10)
            {
                if position.x >= 90.0 &&  position.x <= (self.sliderBackView.frame.size.width-90.0)
                {
                    
                    self.yourHereleading.constant = -35
                }
                else
                    if position.x >= (self.sliderBackView.frame.size.width-90.0)
                    {
                        self.yourHereleading.constant = -70
                    }
                    else
                    {
                        self.yourHereleading.constant = 0
                }
                
                if position.x >= 0.0
                {
                    let totalWidth = self.sliderBackView.frame.size.width-13
                    let percentage = position.x/totalWidth*100
                    self.percentageLbl.text = "\(Int(percentage))%"
                }
                
                self.leading.constant = position.x
                self.widthConstraint.constant = position.x+5
                
            }
        }
  
}


extension UIButton {
    
    
    
    func applyGradient(colours: [UIColor]) -> Void {
        
        self.applyGradient(colours: colours, locations: nil)
        
    }
    
    
    
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> Void {
        
        let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.frame = self.bounds
        
        gradient.colors = colours.map { $0.cgColor }
        
        //gradient.locations = locations
        
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        self.layer.insertSublayer(gradient, at: 0)
        
    }
    
}



extension UIView {
    
    
    
    @IBInspectable var shadow: Bool {
        
        get {
            
            return layer.shadowOpacity > 0.0
            
        }
        
        set {
            
            if newValue == true {
                
                self.addShadow()
                
            }
            
        }
        
    }
    
    
    
    @IBInspectable var cornerRadius: CGFloat {
        
        get {
            
            return self.layer.cornerRadius
            
        }
        
        set {
            
            self.layer.cornerRadius = newValue
            
            
            
            // Don't touch the masksToBound property if a shadow is needed in addition to the cornerRadius
            
            if shadow == false {
                
                self.layer.masksToBounds = true
                
            }
            
        }
        
    }
    
    
    
    
    
    func addShadow(shadowColor: CGColor = UIColor.black.cgColor,
                   
                   shadowOffset: CGSize = CGSize(width: 1.0, height: 2.0),
                   
                   shadowOpacity: Float = 0.4,
                   
                   shadowRadius: CGFloat = 3.0) {
        
        layer.shadowColor = shadowColor
        
        layer.shadowOffset = shadowOffset
        
        layer.shadowOpacity = shadowOpacity
        
        layer.shadowRadius = shadowRadius
        
    }
    
}





@IBDesignable extension UIView {
    
    @IBInspectable var borderColor: UIColor? {
        
        set {
            
            layer.borderColor = newValue?.cgColor
            
        }
        
        get {
            
            guard let color = layer.borderColor else {
                
                return nil
                
            }
            
            return UIColor(cgColor: color)
            
        }
        
    }
    
    @IBInspectable var borderWidth: CGFloat {
        
        set {
            
            layer.borderWidth = newValue
            
        }
        
        get {
            
            return layer.borderWidth
            
        }
        
}

}

