//
//  GameViewController.swift
//  tetris_project
//
//  Created by 田中勇気 on 2020/05/26.
//  Copyright © 2020 IOSapplication_time. All rights reserved.
//テスト
//テスト
//test

//aaaa
//bbbb
//cccc
//dddd
//ラストtest
//pulltest


import UIKit
import SwiftUI
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    // 画面の横幅を取得
      //var screenWidth:CGFloat!
      //var screenHeight:CGFloat!
   // @IBOutlet weak var brock: UIView!
    
   //var timer:Timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        
             // 画面の横幅を取得
            //screenWidth = view.frame.size.width
            //screenHeight = view.frame.size.height
       
        //ブロックを生成
        //if(brock.frame.origin.y == 180){
            let brock = UIView.init(frame: CGRect.init(x: 40, y: 180, width: 40, height: 100))
            let bgColor = UIColor.blue
            brock.backgroundColor = bgColor
            self.view.addSubview(brock)
        //}
//時間
 Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.gravity), userInfo: nil, repeats: true)
 }
//重力
 @objc func gravity() {
    if(brock.frame.origin.y < 180){
    brock.frame.origin.y += 10
    }
 }
    
    
    //左ボタン
    @IBAction func left(_ sender: Any) {
        if(brock.frame.origin.x > 40
            && brock.frame.origin.y < 180){
        brock.frame.origin.x -= 40
        }
        print("afterRect: \(brock.frame)")
    }
    //右ボタン
    @IBAction func right(_ sender: Any) {
        if(brock.frame.origin.x < 320 && brock.frame.origin.y < 180){
        brock.frame.origin.x += 40
        }
        print("afterRect: \(brock.frame)")
    }
    //下ボタン
    @IBAction func under(_ sender: Any) {
        if(brock.frame.origin.y < 180){
        brock.frame.origin.y = 180
        }
        print("afterRect: \(brock.frame)")
    }
    
    //@IBAction func leftturn(_ sender: Any) {}
    
    //@IBAction func rightturn(_ sender: Any) {}
    
}

