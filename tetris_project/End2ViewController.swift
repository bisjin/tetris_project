//
//  End2ViewController.swift
//  tetris_project
//
//  Created by 栗田桂佑 on 2020/07/11.
//  Copyright © 2020 IOSapplication_time. All rights reserved.
//

import UIKit

class End2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
     
    @IBAction func backmenu2(_ sender: Any) {
    self.performSegue(withIdentifier: "moveMenufromEnd2", sender: self)
    }
    
    

}
