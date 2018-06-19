//
//  SiderVC.swift
//  SliderDemoApp
//
//  Created by Inkswipe on 6/11/18.
//  Copyright © 2018 Fortune4 Technologies. All rights reserved.
//

import UIKit

class SiderVC: UIViewController {

    
    @IBOutlet weak var progress: ProgressCustom!
    @IBOutlet weak var slide: SliderView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.slide.setSlider(percentage: 60, animated:true)
        self.progress.clear()
        self.progress.setMaxProgessLeassThan10(progress: 10, fillProgress: 2, pendingProgress: 4)
     
    }
 
    override func viewDidLayoutSubviews() {
        
    }

    
}

class ProgressCustom
: UIView {
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var Imageview1: UIImageView!
    
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var Imageview2: UIImageView!
    
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var Imageview3: UIImageView!
    
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var Imageview4: UIImageView!
    
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var Imageview5: UIImageView!
    
    @IBOutlet weak var view6: UIView!
    @IBOutlet weak var Imageview6: UIImageView!
    
    @IBOutlet weak var view7: UIView!
    @IBOutlet weak var Imageview7: UIImageView!
    
    @IBOutlet weak var view8: UIView!
    @IBOutlet weak var Imageview8: UIImageView!
    
    @IBOutlet weak var view9: UIView!
    @IBOutlet weak var Imageview9: UIImageView!
    
    @IBOutlet weak var view10: UIView!
    @IBOutlet weak var Imageview10: UIImageView!
    
    var ViewArray : [UIView] = []
    var ImageViewArray : [UIImageView] = []
    
    func clear()  {
        
        ViewArray = []
        ImageViewArray = []
        
        ViewArray.append(contentsOf: [view1,view2,view3,view4,view5,view6,view7,view8,view9,view10])
        ImageViewArray.append(contentsOf: [Imageview1,Imageview2,Imageview3,Imageview4,Imageview5,Imageview6,Imageview7,Imageview8,Imageview9,Imageview10])
        
        for view in ViewArray
        {
            
            view.borderWidth = 0
            view.backgroundColor = UIColor.white
            
        }
        for Imageview in ImageViewArray
        {
            Imageview.image = UIImage(named: "")
            Imageview.backgroundColor = UIColor.white
            
        }
    }
    
    func setMaxProgessLeassThan10(progress:Int!,fillProgress:Int!,pendingProgress:Int!)
    {
        let FP = fillProgress-1
        let PP = pendingProgress + fillProgress
        
        for (i,view) in ImageViewArray.enumerated()
        {
            if i<=FP
            {
                
                ViewArray[i].borderWidth = 0
                view.backgroundColor = UIColor(displayP3Red: 252/255, green: 225/255, blue: 40/255, alpha: 1)
                
            }
            else
                if i > FP && i < PP
            {
               
                view.image = UIImage(named: "1")
                
            }
            else
            {
               
               
                ViewArray[i].borderWidth = 0.5
                view.backgroundColor = UIColor.white
                
            }
            
        }
        
        let pp1 = progress-1
        for (i,view) in ViewArray.enumerated()
        {
            if i>pp1
            {
                view.borderWidth = 0
                view.backgroundColor = UIColor.white
                ImageViewArray[i].image = UIImage(named: "")
            }
            else
            {
               
                view.borderWidth = 0.5
                view.backgroundColor = UIColor.white
            }
            
            if i<=FP
            {
                
                 view.borderWidth = 0
                
            }
            else
            if i > FP && i < PP
            {
                
                  view.borderWidth = 0
                
            }
            
        }
        
        
    }

}
