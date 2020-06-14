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
    
    @IBOutlet weak var TimeLabel: UILabel!
    
    //ブロックを定義
    var brock : UIView!
    //終了変数
    var finish:Bool = false
    //test用の変数
    var counter:Int = 0
    //test用の変数2
    var counter2:Int = 0
    //タイマー用変数
    var Time = Timer()
    //制限時間の変数
    var timecounter = 60
    //ゲームスタート時の時間
    //let StartTime: Date = Date()
    //ポーズ時の時間
    //var PauseTime: Date = Date()
    
    //ステージ上のマス目12*21
    var masume : [[Int]] = [[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0]]
     
    
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
        let brock_Value = Int.random(in: 0 ... 7)
        brock_create(brock_Value: brock_Value)
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
 Time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.gravity), userInfo: nil, repeats: true)
    }
    
//ブロック生成
    @objc func brock_create(brock_Value:Int){
          brock = UIView(frame: CGRect(x:192, y:40, width:30, height:30))
        if(brock_Value == 0){
        let bgColor = UIColor.blue
        brock.backgroundColor = bgColor
        }
        if(brock_Value == 1){
        let bgColor = UIColor.red
        brock.backgroundColor = bgColor
        }
        if(brock_Value == 2){
        let bgColor = UIColor.green
        brock.backgroundColor = bgColor
        }
        if(brock_Value == 3){
        let bgColor = UIColor.yellow
        brock.backgroundColor = bgColor
        }
        if(brock_Value == 4){
        let bgColor = UIColor.orange
        brock.backgroundColor = bgColor
        }
        if(brock_Value == 5){
        let bgColor = UIColor.purple
        brock.backgroundColor = bgColor
        }
        if(brock_Value == 6){
        let bgColor = UIColor.magenta
        brock.backgroundColor = bgColor
        }
        if(brock_Value == 7){
        let bgColor = UIColor.cyan
        brock.backgroundColor = bgColor
        }
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
    
    TimeLabel.text = String(timecounter)
    //制限時間の表示
    
    if(timecounter == 0){
        Time.invalidate()
        self.performSegue(withIdentifier: "moveEnd", sender: self)
    }
    //0秒になったらタイマーを停止して終了画面へ移動
    
     timecounter -= 1
    //制限時間カウント
    
    counter2 += 1
    print(counter2)
    if(brock.frame.origin.y < 630){
    brock.frame.origin.y += 30
    }
    if(counter2%21==0){
        let brock_Value = Int.random(in: 0 ... 7)
        brock_create(brock_Value: brock_Value)
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
        let brock_Value = Int.random(in: 0 ... 7)
        brock_create(brock_Value: brock_Value)
    }
    
    //@IBAction func leftturn(_ sender: Any) {}
    
    //@IBAction func rightturn(_ sender: Any) {}
    
    
    
    @IBAction func pause(_ sender: Any) {
        Time.invalidate()
    //タイマーの停止?
    self.performSegue(withIdentifier: "moveModal", sender: self)
    }
    //pause画面を表示
    
    
    
    
        
    
}
