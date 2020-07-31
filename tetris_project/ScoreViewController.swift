//
//  ScoreViewController.swift
//  tetris_project
//
//  Created by 田中勇気 on 2020/07/27.
//  Copyright © 2020 IOSapplication_time. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {

    static let instance = ScoreViewController()
    
    //配列の要素
    var arrycount:Int!
    //記録用配列、スコアと名前
    var Records:[String] = []
    var Recordn:[String] = []
    
    //var practice = "ああああ"
    override func viewDidLoad() {
        super.viewDidLoad()

        arrycount = Records.count
        
        //Recordn.append(recname)
        //Records.append(recscore)
        //Records[Index!].append(contentsOf: [recscore as String])
        arrycount = Records.count
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
