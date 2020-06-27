//
//  ModalViewController.swift
//  tetris_project
//
//  Created by 栗田桂佑 on 2020/06/13.
//  Copyright © 2020 IOSapplication_time. All rights reserved.
//

import UIKit


class ModalViewController: UIViewController {
    
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        //alphaで画面透過
        

        // Do any additional setup after loading the view.
    }
    

    @IBAction func backgame(_ sender: Any) {
        let vc = self.presentingViewController as! GameViewController
        //vcをGameViewControllerにキャスト
        vc.Backfrompause = true
        dismiss(animated: true, completion: nil)
    }
    //ゲームを再開
    
    @IBAction func retry(_ sender: Any) {
        self.performSegue(withIdentifier: "moveretry", sender: self)
    }
    //ゲーム画面を再度起動
    
    @IBAction func backmenu(_ sender: Any) {

        self.performSegue(withIdentifier: "moveMenufromPause", sender: self)
        
    }
    //pauseからメニューへ移動
    
    
   

}
