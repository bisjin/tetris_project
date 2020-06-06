//
//  StartViewController.swift
//  tetris_project
//
//  Created by 栗田桂佑 on 2020/06/06.
//  Copyright © 2020 IOSapplication_time. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func tapStart(_ sender: Any) {
        self.performSegue(withIdentifier: "moveGame", sender: self)
    }//ゲーム画面へ移動
    
    @IBAction func taphowto(_ sender: Any) {
       self.performSegue(withIdentifier: "movehowto", sender: self)
    }//遊び方へ移動
    
    @IBAction func tapScoreRanking(_ sender: Any) {
        self.performSegue(withIdentifier: "moveScoreRanking", sender: self)
    }//スコアランキングへ移動
    
    @IBAction func backstart(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }//遊び方から戻る
    
    @IBAction func backstart2(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }//スコアランキングから戻る
   
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
