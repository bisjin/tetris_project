//
//  ScoreRankingViewController.swift
//  tetris_project
//
//  Created by 栗田桂佑 on 2020/07/11.
//  Copyright © 2020 IOSapplication_time. All rights reserved.
//

import UIKit

class ScoreRankingViewController: UIViewController {

    let gameviewcontroller = GameViewController.instance
    
    @IBOutlet weak var recentscore: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //let score = (UIApplication.shared.delegate as! GameViewController).score
        //上のを簡単にした
        //let scorefile = UIApplication.shared.delegate as! GameViewController
        //let score = self.scorefile.score
        //let score = GameViewController.score
        //ランキングに保存する用
        //ランキングに保存する用
        print("scorelist:\(gameviewcontroller.scorelist)")
        
        print("score:\(gameviewcontroller.score)")
        recentscore.text = String(gameviewcontroller.score)
        
        
    }
    
    
    @IBAction func backstart2(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }//遊び方から戻る
    

}
