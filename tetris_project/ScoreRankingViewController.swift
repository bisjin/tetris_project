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
    @IBOutlet weak var TableView: UITableView!
    
    //一時記録用変数
    var recscore:String!
    var recname:String!
    //配列の要素
    var arrycount:Int!
    //記録用配列、スコアと名前
    //var Records:[String] = []
    //var Recordn:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        arrycount = kiroku.Records.count
        
        //print(kiroku.practice)
        
        Recentscore.text = recscore
        print("スコアランキングうううううううううううううう")
        
        kiroku.Recordn.append(recname)
        kiroku.Records.append(recscore)
        arrycount = kiroku.Records.count
        
        print("記録\(kiroku.Records)")
        print("名前\(kiroku.Recordn)")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kiroku.Recordn.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "RCell", for: indexPath)
        
        // セルに表示する値を設定する
        cell.textLabel!.text = kiroku.Recordn[indexPath.row]
        //self.staff_name.text = String((Record[0][1]))
        return cell
    }
    
    func tableView2(_ tableView2: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kiroku.Records.count
    }
    
    func tableView2(_ tableView2: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell2: UITableViewCell = tableView2.dequeueReusableCell(withIdentifier: "RCell2", for: indexPath)
        
        // セルに表示する値を設定する
        cell2.textLabel!.text = kiroku.Records[indexPath.row]
        //self.staff_name.text = String((Record[0][1]))
        return cell2
    }
    
    
    @IBAction func backstart2(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }//遊び方から戻る
    

}
