//
//  StartCountViewController.swift
//  tetris_project
//
//  Created by 栗田桂佑 on 2020/07/20.
//  Copyright © 2020 IOSapplication_time. All rights reserved.
//

import UIKit

class StartCountViewController: UIViewController {

    
    
    @IBOutlet weak var CountLabel: UILabel!
    var Startcounter = 3
    var Counttime = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       Counttime = Timer.scheduledTimer(timeInterval: 1, target: self, selector:#selector(StartCountViewController.Count), userInfo: nil, repeats: true)
    }
    

   @objc func Count(){
    Startcounter -= 1
     CountLabel.text = String(Startcounter)
       if Startcounter == 0{
        Counttime.invalidate()
           self.performSegue(withIdentifier: "moveGame", sender: self)
       }
   
       
       
   }

}
