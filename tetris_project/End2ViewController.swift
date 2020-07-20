//
//  End2ViewController.swift
//  tetris_project
//
//  Created by 栗田桂佑 on 2020/07/11.
//  Copyright © 2020 IOSapplication_time. All rights reserved.
//

import UIKit

class End2ViewController: UIViewController {

    @IBOutlet weak var ScoreLabel: UILabel!
    
    var score :String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ScoreLabel.text = score
        print("ScoreLabel.text \(String(describing: ScoreLabel.text) )")
    }
    
     
    @IBAction func backmenu2(_ sender: Any) {
    self.performSegue(withIdentifier: "moveMenufromEnd2", sender: self)
    }
    @IBAction func savescore(_ sender: Any) {
        
    }
    
    

}
