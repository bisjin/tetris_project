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
    
    let gameviewcontroller = GameViewController.instance
    
    @IBOutlet weak var Recentscore: UILabel!
    @IBOutlet weak var TableView: UITableView!
    
    //一時記録用変数
    var recscore:String = ""
    var recname:String?
    var
    //配列の要素
    var arrycount=0
    //記録用配列、スコアと名前
    var Record:[[String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        Recentscore.text = recscore
        print("スコアランキングうううううううううううううう")
        Record.append([String]())
        Record.append([recname! as String])
        let Index = Record.firstIndex(of:[recname! as String])
        Record[Index!].append(contentsOf: [recscore as String])
        arrycount = Record.count
        //print("Recentscore最近の得点に入ってるやつ::::\(String(describing: Recentscore.text))")
        
        //print("rename 一時名前の保存用変数::::\(String(describing: recname))")
        
        print("配列の要素数::\(arrycount)")
        print(Record)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Record.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "RCell", for: indexPath)
        
        // セルに表示する値を設定する
        cell.textLabel!.text = Record[indexPath.row]
        self.staff_name.text = String((Record[0][1]))
        return cell
    }
    
    
    @IBAction func backstart2(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }//遊び方から戻る
    

}
