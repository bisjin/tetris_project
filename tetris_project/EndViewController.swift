//
//  EndViewController.swift
//  tetris_project
//
//  Created by 栗田桂佑 on 2020/06/14.
//  Copyright © 2020 IOSapplication_time. All rights reserved.
//

import UIKit

class EndViewController: UIViewController {

    @IBOutlet weak var ScoreLabel: UILabel!
    
    var score:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        ScoreLabel.text = score
        print("ScoreLabel.text \(String(describing: ScoreLabel.text) )")
    }
    

    @IBAction func backmenu(_ sender: Any) {
        self.performSegue(withIdentifier: "moveMenufromEnd", sender: self)
    }
    @IBAction func savescore(_ sender: Any) {
        
    }
    //終了画面からメニューへ移動
    
    
   
}
