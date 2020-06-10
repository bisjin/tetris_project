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
    //ブロックを定義
    var brock : UIView!
    //終了変数
    var finish:Bool = false
    //test用の変数
    var counter:Int = 0
    //test用の変数2
    var counter2:Int = 0
    //ステージ上のマス目
    var masume : [[Int]] = [[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0]]
    
    //struct brock_struct {
    //    let flg = 0
    //    var brock : UIView!
    //}
    // 画面の横幅を取得
      //var screenWidth:CGFloat!
      //var screenHeight:CGFloat!
   // @IBOutlet weak var brock: UIView!
    
   //var timer:Timer = Timer()
    
    /*a[3][3]={0 1 0 0
             0 1 0 0
             0 1 0 0
             0 1 0 0}*/
    var bar = [
    [0,1,0,0],
    [0,1,0,0],
    [0,1,0,0],
    [0,1,0,0]]
    
    /*a2[3][3]={0 0 0 0
              0 0 0 0
              1 1 1 1
              0 0 0 0}*/
    var yoko_bar = [
    [0,0,0,0],
    [0,0,0,0],
    [1,1,1,1],
    [0,0,0,0]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
             // 画面の横幅を取得
            //screenWidth = view.frame.size.width
            //screenHeight = view.frame.size.height
       
        //ブロックを生成
        //生成の基本関数
        brock_create()
        /*repeat{
            switch counter {
            case 0:
                print("counter:\(counter)")
                brock_create()
                counter+=1
            default :
                //if(brock.frame.origin.y <= 240){
                    print("aaaa")
                       // brock = nil
                        brock_create()
                        counter+=1
                //}
            }
        }while(counter==10)
        //}while(!finish)*/
//時間
 Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.gravity), userInfo: nil, repeats: true)
    }
    
//ブロック生成
    @objc func brock_create(){
        brock = UIView(frame: CGRect(x:192, y:40, width:30, height:30))
        let bgColor = UIColor.blue
        brock.backgroundColor = bgColor
        // 枠線の色
        brock.layer.borderColor = UIColor.black.cgColor
        // 枠線の太さ
        brock.layer.borderWidth = 2
        brock.layer.masksToBounds = true
        self.view.addSubview(brock)
    }
    
    /*ブロックを配列の形式で表示
    @objc func brock_array(){
        for(){
    
        }
    }*/
    
//重力
 @objc func gravity() {
    
    counter2 += 1
    print(counter2)
    if(brock.frame.origin.y < 630){
    brock.frame.origin.y += 30
    }
    if(counter2%21==0){
        brock_create()
    }
 }
    
    
    //左ボタン
    @IBAction func left(_ sender: Any) {
        if(brock.frame.origin.x > 12
            && brock.frame.origin.y < 640){
        brock.frame.origin.x -= 30
        }
        print("afterRect: \(brock.frame)")
    }
    //右ボタン
    @IBAction func right(_ sender: Any) {
        if(brock.frame.origin.x < 372 && brock.frame.origin.y < 640){
        brock.frame.origin.x += 30
        }
        print("afterRect: \(brock.frame)")
    }
    //下ボタン
    @IBAction func under(_ sender: Any) {
        if(brock.frame.origin.y < 640){
        brock.frame.origin.y = 640
        }
        print("afterRect: \(brock.frame)")
        counter2 = 0
        brock_create()
    }
    
    //@IBAction func leftturn(_ sender: Any) {}
    
    //@IBAction func rightturn(_ sender: Any) {}
    
    
}
