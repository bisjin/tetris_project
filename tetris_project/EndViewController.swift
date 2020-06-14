//
//  EndViewController.swift
//  tetris_project
//
//  Created by 栗田桂佑 on 2020/06/14.
//  Copyright © 2020 IOSapplication_time. All rights reserved.
//

import UIKit

class EndViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func backmenu(_ sender: Any) {
        self.performSegue(withIdentifier: "moveMenufromEnd", sender: self)
    }
    //終了画面からメニューへ移動
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
