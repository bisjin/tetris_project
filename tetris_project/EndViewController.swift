//
//  EndViewController.swift
//  tetris_project
//
//  Created by 栗田桂佑 on 2020/06/14.
//  Copyright © 2020 IOSapplication_time. All rights reserved.
//

import UIKit
import SwiftUI
import SpriteKit
import GameplayKit
import AVFoundation

class EndViewController: UIViewController {

    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var EnterName: UITextField!
    @IBOutlet weak var finprint: UILabel!
    
    var score:Any?
    var name:String?
    var gameRecord:[[Any]] = []
    var Record:[[Any]] = [[]]
    
    var mis:Bool = false
    var over:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(mis == true){
            finprint.text = "MISSION CLEAR!"
        }
        if(over == true){
            finprint.text = "TIME UP"
        }
        
        // Do any additional setup after loading the view.
        ScoreLabel.text = score as? String
        name = EnterName.text!
        //print("テキストフィールドに入っている文字列::\(String(describing: EnterName))")
        print("ScoreLabel.text \(String(describing: ScoreLabel.text) )")
        //print("score.score.score.\(String(describing: score))")
        
        //gameRecord.append((score) as! [Any])
    }
    

    @IBAction func backmenu(_ sender: Any) {
        self.performSegue(withIdentifier: "moveMenufromEnd", sender: self)
    }//終了画面からメニューへ移動
    
    @IBAction func savescore(_ sender: Any) {
        name = EnterName.text
        print("テキストフィールドに入っている文字列::\(String(describing: EnterName.text))")
        print("ScoreLabel.text \(String(describing: ScoreLabel.text) )")
        print("score.score.score.\(String(describing: score))")
        self.performSegue(withIdentifier: "toRanking", sender: self)
    }
    
    //画面遷移によるスコアランキングのRecordへ保存
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         print("segueによる値渡し")
        //segueのIDを確認して特定のsegueのときのみ動作させる
        if (segue.identifier == "toRanking") {
            // 2. 遷移先のViewControllerを取得
            let next = segue.destination as? ScoreRankingViewController
            // 3. １で用意した遷移先の変数に値を渡す
            next?.recscore = (self.score as? String)!
            print("入力した名前:::\(String(describing: name))")
            next?.recname = self.name
            //print("End.Score:\(String(describing: next?.score))")
        }
    }
    
}
