//
//  GameViewController.swift
//  tetris_project
//
//  Created by 田中勇気 on 2020/05/26.
//  Copyright © 2020 IOSapplication_time. All rights reserved.



import UIKit
import SwiftUI
import SpriteKit
import GameplayKit

var animator : UIDynamicAnimator!

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
    var teto_stage = [[Int]](repeating:[Int](repeating:0,count: 12),count: 21)
    /*var masume : [[Int]] = [[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0]]
     
    */
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

//時間
        Time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.gravity), userInfo: nil, repeats: true)

    }
    
//ブロック生成
    @objc func brock_create(brock_Value:Int){
          brock = UIView(frame: CGRect(x:192, y:40, width:30, height:30))
        brock.tag = 1;
        if(brock_Value == 0){
            brock0()
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
     //I字ブロック(blue)
     @objc func brock0(){
        for i in 0..<4{
            for j in 0..<4{
                 if(bar[i][j] == 1){
                    teto_stage[4-i][8-j] = 1
                    /*
                     brock = UIView(frame: CGRect(x:102+(j*30), y:40+(i*30), width:30, height:30))
                    brock.tag = 1;
                  let bgColor = UIColor.blue
                  brock.backgroundColor = bgColor
          brock.layer.borderColor = UIColor.black.cgColor
                            // 枠線の太さ
                            brock.layer.borderWidth = 2
                            brock.layer.masksToBounds = true
                            self.view.addSubview(brock)
                     */
                 }
            }
        }
    }
    
    @objc func brock_draw(){
        for_i :for y in 0..<12{
         for x in 0..<21{
            if(teto_stage[x][y] == 1){
                brock = UIView(frame: CGRect(x:(y*30), y:(x*30), width:30, height:30))
                                   brock.tag = 1;
                                 let bgColor = UIColor.blue
                                 brock.backgroundColor = bgColor
                         brock.layer.borderColor = UIColor.black.cgColor
                                           // 枠線の太さ
                                           brock.layer.borderWidth = 2
                                           brock.layer.masksToBounds = true
                                           self.view.addSubview(brock)
                
                }
            }
        }
    }
//重力
 @objc func gravity() {
    
    TimeLabel.text = String(timecounter)
    //制限時間の表示
    
    print(teto_stage)
    //stage確認用
    
    for v in view.subviews{
        if let v = v as? UIView, v.tag == 1{
            v.removeFromSuperview()
        }
    }
 
    
    brock_draw()
    
    //brockの削除
    
    if(timecounter == 0){
        Time.invalidate()
        self.performSegue(withIdentifier: "moveEnd", sender: self)
    }
    //0秒になったらタイマーを停止して終了画面へ移動
    
     timecounter -= 1
    //制限時間カウント
    
    counter2 += 1
    print(counter2)
    /*
    if(brock.frame.origin.y < 630){
    brock.frame.origin.y += 30
    }
    */
    
    print(teto_stage)
    //stage確認用
    
    for_i :for y in 0..<21{
        //print("brock_check x =",y)
       
        //x
        for x in 0..<12{
             //print("brock_check y =",x)
            
            //print("ccc")
            print("x\(11-x)")
            print("y\(20-y)")
            
        
            //その配列にブロックがある時
            if(teto_stage[20-y][11-x] == 1){
                print("Find!!")
                //ブロックが一番下に来た時
                if(y==0){
                     teto_stage[20-y][11-x] = 2
                    print("break1")
                    break for_i
                }//それ以外の場合
                else{
                    //下のブロックが2である時、その場で固定、2になる
                    if(teto_stage[20-y][11-x+1] == 2){
                    teto_stage[20-y][11-x] = 2
                        //brock.tag = 2;
                    //次のブロックを生成する
                    /*
                    let brock_Value = Int.random(in: 0 ... 7)
                        brock_create(brock_Value: brock_Value)
                        print("break2")
                        break for_i
                    */
                    //ブロックを構成する小さなブロックひとつしか固定されない？
                    }//それ以外の場合、ブロックが１つ下に下がる
                    else{
                        teto_stage[20-y][11-x] = 0
                        teto_stage[20-y+1][11-x] = 1
                        print("break3")
                        //break for_i
                    }
                }
            }
        }
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
