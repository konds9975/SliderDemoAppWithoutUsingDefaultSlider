//
//  SiderVC.swift
//  SliderDemoApp
//
//  Created by Inkswipe on 6/11/18.
//  Copyright © 2018 Fortune4 Technologies. All rights reserved.
//

import UIKit

class SiderVC: UIViewController {

    
    @IBOutlet weak var slide: SliderView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.slide.setSlider(percentage: 60, animated:true)
       
      
    }
    override func viewDidLayoutSubviews() {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
