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
    var brock : UIView!
    
    //struct brock_struct {
    //    let flg = 0
    //    var brock : UIView!
    //}
    // 画面の横幅を取得
      //var screenWidth:CGFloat!
      //var screenHeight:CGFloat!
   // @IBOutlet weak var brock: UIView!
    
   //var timer:Timer = Timer()
    
    //a[3][3]={0 1 0 0
    //         0 1 0 0
    //         0 1 0 0
    //         0 1 0 0}
    
    //a2[3][3]={0 0 0 0
    //          0 0 0 0
    //          1 1 1 1
    //          0 0 0 0}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
             // 画面の横幅を取得
            //screenWidth = view.frame.size.width
            //screenHeight = view.frame.size.height
       
        //ブロックを生成
        //if(brock.frame.origin.y == 180){
            brock_create()
        //}
//時間
 Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.gravity), userInfo: nil, repeats: true)
 }
//ブロック生成
    @objc func brock_create(){
        brock = UIView(frame: CGRect(x:180, y:50, width:30, height:30))
        let bgColor = UIColor.blue
        brock.backgroundColor = bgColor
        // 枠線の色
        brock.layer.borderColor = UIColor.black.cgColor
        // 枠線の太さ
        brock.layer.borderWidth = 2
        brock.layer.masksToBounds = true
        self.view.addSubview(brock)
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
