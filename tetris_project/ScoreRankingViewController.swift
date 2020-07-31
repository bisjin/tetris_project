//
//  ScoreRankingViewController.swift
//  tetris_project
//
//  Created by 栗田桂佑 on 2020/07/11.
//  Copyright © 2020 IOSapplication_time. All rights reserved.
//

import UIKit
import SwiftUI
import SpriteKit
import GameplayKit
import AVFoundation

class ScoreRankingViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    let kiroku = ScoreViewController.instance

    
    @IBOutlet weak var Recentscore: UILabel!
    @IBOutlet weak var PlayerName: UILabel!
    @IBOutlet weak var TableView: UITableView!
    
    //一時記録用変数
    var recscore:Int = 0
    var recname:String = "none"
    //配列の要素
    var arrycount:Int!
    //記録用配列、スコアと名前
    //var Records:[String] = []
    //var Recordn:[String] = []
    var touch:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        arrycount = kiroku.Records.count
        
        //print(kiroku.practice)
        
        //print("スコアランキングうううううううううううううう")
        //print("recscore::\(String(describing: recscore))")
        kiroku.Recordn.append(recname)
        kiroku.Records.append(recscore)
        if(kiroku.highscore < recscore){
            kiroku.highscore = recscore
            kiroku.highname = recname
        }
        
        let high: String = String(kiroku.highscore)
        
        Recentscore.text = high
        PlayerName.text = kiroku.highname
        
        arrycount = kiroku.Records.count
        
        print("記録\(kiroku.Records)")
        print("名前\(kiroku.Recordn)")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kiroku.Recordn.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //print("\(indexPath.row)番目の行が選択されました。")
        
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "RCell", for: indexPath)
        
        // セルに表示する値を設定する
        cell.textLabel!.text = kiroku.Recordn[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
    
        //print("\(indexPath.row)番目の行が選択されました。")
        
        let textl:String = String(kiroku.Records[indexPath.row])
        
         var alertController = UIAlertController()
          alertController = UIAlertController(title:kiroku.Recordn[indexPath.row] ,message: textl,preferredStyle: .alert)
          alertController.addAction(UIAlertAction(title: "OK",style: .default,handler: nil))
          present(alertController, animated: true)
    }
    
    
    @IBAction func backstart2(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }//遊び方から戻る
    
    @IBAction func Tomenu(_ sender: Any) {
        self.performSegue(withIdentifier: "tomenu", sender: self)
    }//スタート画面へ戻る
    

}
