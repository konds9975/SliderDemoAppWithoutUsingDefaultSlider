//
//  DrowingVC.swift
//  SliderDemoApp
//
//  Created by Inkswipe on 6/11/18.
//  Copyright © 2018 Fortune4 Technologies. All rights reserved.
//

import UIKit
import SpriteKit
class DrowingVC: UIViewController {

    var mainArray = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        
        super.touchesBegan(touches, with: event)
        let touch: AnyObject? = touches.first
        array = NSMutableArray()
        path=UIBezierPath()
        let lastPoint = touch!.previousLocation(in: self.view)
        path?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
     
    }
    var array = NSMutableArray()
    
    @IBAction func undoButtonAction(_ sender: Any) {
        
            if let aa = mainArray.lastObject as? NSMutableArray
            {
                for object in aa
                {
                    if let shapeLayer = object as? CAShapeLayer
                    {
                        shapeLayer.removeFromSuperlayer()
                        
                    }
                }
                self.array.removeAllObjects()
                self.mainArray.removeLastObject()
            }
        
        
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        super.touchesMoved(touches, with: event)
        let touch: AnyObject? = touches.first
        let currentPoint = touch!.location(in: self.view)
        path?.addLine(to: CGPoint(x: currentPoint.x, y: currentPoint.y))
        //Design path in layer
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path?.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor =  UIColor.orange.cgColor
        shapeLayer.lineWidth = 1
        self.array.add(shapeLayer)
        self.view.layer.addSublayer(shapeLayer)
        
        
        
    }
    
    
    var path : UIBezierPath!
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        super.touchesEnded(touches, with: event)
        self.mainArray.add(array)
        
    }
 
}
