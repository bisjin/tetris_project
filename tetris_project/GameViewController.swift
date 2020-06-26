//
//  GameViewController.swift
//  tetris_project
//
//  Created by 田中勇気 on 2020/05/26.
//  Copyright © 2020 IOSapplication_time. All rights reserved.

//brock.tag tag = 1 なら削除。現状全削除
//teto_stage の数値に色情報を持たせる　１０未満なら動いている１０以上なら固定されている
//teto_stage の判断のためにランダム範囲0~7を1~7に変更

import UIKit
import SwiftUI
import SpriteKit
import GameplayKit

var animator : UIDynamicAnimator!

var brock_Value = Int.random(in: 1 ... 7)

var br_count = 0

var brock_serch_y = [0,0,0,0]
var brock_serch_x = [0,0,0,0]

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
    
    var idou_flg = 0
    //ゲームスタート時の時間
    //let StartTime: Date = Date()
    //ポーズ時の時間
    //var PauseTime: Date = Date()
    
    //ステージ上のマス目12*20
    var teto_stage = [[Int]](repeating:[Int](repeating:0,count: 12),count: 20)
    /*var masume : [[Int]] = [[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0]]
     
    */
    
    
    
    var bar = [
    [0,1,0,0],
    [0,1,0,0],
    [0,1,0,0],
    [0,1,0,0]]
    
   
    var yoko_bar = [
    [0,0,0,0],
    [0,0,0,0],
    [1,1,1,1],
    [0,0,0,0]]
    
    var Tzi = [
       [0,0,0,0],
       [0,1,0,0],
       [1,1,1,0],
       [0,0,0,0]]
       
    var Tzi_yoko1 = [
       [0,0,0,0],
       [0,1,0,0],
       [0,1,1,0],
       [0,1,0,0]]
    
    var Tzi_yoko2 = [
        [0,0,0,0],
        [1,1,1,0],
        [0,1,0,0],
        [0,0,0,0]]
    
    var Tzi_yoko3 = [
        [0,0,0,0],
        [0,0,1,0],
        [0,1,1,0],
        [0,0,1,0]]
    
    var Lzi = [
          [0,1,0,0],
          [0,1,0,0],
          [0,1,1,0],
          [0,0,0,0]]
    
    var Jzi = [
             [0,0,1,0],
             [0,0,1,0],
             [0,1,1,0],
             [0,0,0,0]]
    
    var Szi = [
            [0,0,0,0],
            [0,1,1,0],
            [1,1,0,0],
            [0,0,0,0]]
    
    var Zzi = [
            [0,0,0,0],
            [0,1,1,0],
            [0,0,1,1],
            [0,0,0,0]]
    
    var Ozi = [
            [0,0,0,0],
            [0,1,1,0],
            [0,1,1,0],
            [0,0,0,0]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ブロックを生成
        //生成の基本関数
        //let brock_Value = Int.random(in: 1 ... 7)
        brock_create(brock_Value: brock_Value)

//時間
        Time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.gravity), userInfo: nil, repeats: true)

    }
    
//ブロック生成
    @objc func brock_create(brock_Value:Int){
        counter2 = 0
        if(brock_Value == 1){
            brock1()
        }
        if(brock_Value == 2){
            brock2()
        }
        if(brock_Value == 3){
            brock3()
        }
        if(brock_Value == 4){
            brock4()
        }
        if(brock_Value == 5){
            brock5()
        }
        if(brock_Value == 6){
            brock6()
        }
        if(brock_Value == 7){
            brock7()
        }
       
    }
    
    /*ブロックを配列の形式で表示
    @objc func brock_array(){
        for(){
    
        }
    }*/
     //I字ブロック(blue)
     @objc func brock1(){
        for i in 0..<4{
            for j in 0..<4{
                 if(bar[i][j] == 1){
                    teto_stage[4-i][8-j] = 1
                 }
            }
        }
    }
    //T字ブロック(red)
     @objc func brock2(){
        for i in 0..<4{
            for j in 0..<4{
                 if(Tzi[i][j] == 1){
                    teto_stage[4-i][8-j] = 2
                 }
            }
        }
    }
    //L字ブロック(green)
        @objc func brock3(){
           for i in 0..<4{
               for j in 0..<4{
                    if(Lzi[i][j] == 1){
                       teto_stage[4-i][8-j] = 3
                    }
               }
           }
       }
    //J字ブロック(yellow)
        @objc func brock4(){
           for i in 0..<4{
               for j in 0..<4{
                    if(Jzi[i][j] == 1){
                       teto_stage[4-i][8-j] = 4
                    }
               }
           }
       }
    //S字ブロック(orange)
        @objc func brock5(){
           for i in 0..<4{
               for j in 0..<4{
                    if(Szi[i][j] == 1){
                       teto_stage[4-i][8-j] = 5
                    }
               }
           }
       }
    //Z字ブロック(purple)
        @objc func brock6(){
           for i in 0..<4{
               for j in 0..<4{
                    if(Zzi[i][j] == 1){
                       teto_stage[4-i][8-j] = 6
                    }
               }
           }
       }
    //O字ブロック(magenta)
        @objc func brock7(){
           for i in 0..<4{
               for j in 0..<4{
                    if(Ozi[i][j] == 1){
                       teto_stage[4-i][8-j] = 7
                    }
               }
           }
       }
    
    
    @objc func brock_draw(){
        for_i :for y in 0..<12{
         for x in 0..<20{
            if(teto_stage[x][y] == 1 || teto_stage[x][y] == 10){
                brock = UIView(frame: CGRect(x:27+(y*30), y:40+(x*30), width:30, height:30))
                                   brock.tag = 1;
                                 let bgColor = UIColor.blue
                                 brock.backgroundColor = bgColor
                         brock.layer.borderColor = UIColor.black.cgColor
                                           // 枠線の太さ
                                           brock.layer.borderWidth = 2
                                           brock.layer.masksToBounds = true
                                           self.view.addSubview(brock)
                
                }
        if(teto_stage[x][y] == 2 || teto_stage[x][y] == 20){
              brock = UIView(frame: CGRect(x:27+(y*30), y:40+(x*30), width:30, height:30))
                                 brock.tag = 1;
                               let bgColor = UIColor.red
                               brock.backgroundColor = bgColor
                       brock.layer.borderColor = UIColor.black.cgColor
                                         // 枠線の太さ
                                         brock.layer.borderWidth = 2
                                         brock.layer.masksToBounds = true
                                         self.view.addSubview(brock)
              
                  }
            if(teto_stage[x][y] == 3 || teto_stage[x][y] == 30){
                   brock = UIView(frame: CGRect(x:27+(y*30), y:40+(x*30), width:30, height:30))
                                      brock.tag = 1;
                                    let bgColor = UIColor.green
                                    brock.backgroundColor = bgColor
                            brock.layer.borderColor = UIColor.black.cgColor
                                              // 枠線の太さ
                                              brock.layer.borderWidth = 2
                                              brock.layer.masksToBounds = true
                                              self.view.addSubview(brock)
                   
                       }
            if(teto_stage[x][y] == 4 || teto_stage[x][y] == 40){
                   brock = UIView(frame: CGRect(x:27+(y*30), y:40+(x*30), width:30, height:30))
                                      brock.tag = 1;
                                    let bgColor = UIColor.yellow
                                    brock.backgroundColor = bgColor
                            brock.layer.borderColor = UIColor.black.cgColor
                                              // 枠線の太さ
                                              brock.layer.borderWidth = 2
                                              brock.layer.masksToBounds = true
                                              self.view.addSubview(brock)
                   
                       }
            if(teto_stage[x][y] == 5 || teto_stage[x][y] == 50){
                   brock = UIView(frame: CGRect(x:27+(y*30), y:40+(x*30), width:30, height:30))
                                      brock.tag = 1;
                                    let bgColor = UIColor.orange
                                    brock.backgroundColor = bgColor
                            brock.layer.borderColor = UIColor.black.cgColor
                                              // 枠線の太さ
                                              brock.layer.borderWidth = 2
                                              brock.layer.masksToBounds = true
                                              self.view.addSubview(brock)
                   
                       }
            if(teto_stage[x][y] == 6 || teto_stage[x][y] == 60){
                   brock = UIView(frame: CGRect(x:27+(y*30), y:40+(x*30), width:30, height:30))
                                      brock.tag = 1;
                                    let bgColor = UIColor.purple
                                    brock.backgroundColor = bgColor
                            brock.layer.borderColor = UIColor.black.cgColor
                                              // 枠線の太さ
                                              brock.layer.borderWidth = 2
                                              brock.layer.masksToBounds = true
                                              self.view.addSubview(brock)
                   
                       }
            if(teto_stage[x][y] == 7 || teto_stage[x][y] == 70){
                   brock = UIView(frame: CGRect(x:27+(y*30), y:40+(x*30), width:30, height:30))
                                      brock.tag = 1;
                                    let bgColor = UIColor.magenta
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
    for v in view.subviews{
        if let v = v as? UIView, v.tag == 1{
            v.removeFromSuperview()
        }
    }
    
    brock_draw()
    
    if(timecounter == 0){
        Time.invalidate()
        self.performSegue(withIdentifier: "moveEnd", sender: self)
    }
    //0秒になったらタイマーを停止して終了画面へ移動
    
     timecounter -= 1
     timecounter += 1
    //制限時間カウント
    counter2 += 1
    print("counter2 = \(counter2)")
    if(idou_flg == 1){
        idou_flg = 0
        br_count = 0
        print("ridatu")
        return
    }
    brock_gravity()
    
/*
    if(counter2%21==0){
    var brock_Value = Int.random(in: 1 ... 7)
    brock_create(brock_Value: brock_Value)
    }
 */
}




@objc func brock_gravity(){
    var bro_y = [0,0,0,0]
    var bro_x = [0,0,0,0]
    for_i :for var y in 0..<20{
           for var x in 0..<12{

               //その配列にブロックがある時
               if(teto_stage[19-y][11-x] < 10 && teto_stage[19-y][11-x] != 0){
                   print("Find!!")
                   //ブロックが一番下に来た時
                   if(y==0){
                        teto_stage[19-y][11-x] = teto_stage[19-y][11-x] * 10
                       print("break1")
                       print(teto_stage)
                       brock_fix()
                       br_count = 0
                        var brock_Value = Int.random(in: 1 ... 7)
                        brock_create(brock_Value: brock_Value)
                    return
                   }//それ以外の場合
                   else{
                       //下のブロックが2である時、その場で固定、2になる
                       if(teto_stage[19-y+1][11-x] >= 10){
                       teto_stage[19-y][11-x] = teto_stage[19-y][11-x] * 10
                           print("break2")
                           brock_fix()
                           br_count = 0
                       }//それ以外の場合、ブロックが１つ下に下がる
                       else{
                           br_count += 1
                          
                               bro_y[br_count-1] = y
                               bro_x[br_count-1] = x
                        if(idou_flg == 1){
                            idou_flg = 0
                            br_count = 0
                            print("ridatu")
                            return
                        }
                        if(br_count == 4){
                               print("bro_x\(bro_x),bro_y\(bro_y)copy")
                          
                               for g in 0..<4{
                           teto_stage[19-bro_y[g]+1][11-bro_x[g]] = teto_stage[19-bro_y[g]][11-bro_x[g]]
                           teto_stage[19-bro_y[g]][11-bro_x[g]] = 0
                           
                               }
                           print("break3")
                           br_count = 0
                           }
                       }
                   }
               }
           }
        }
    print(teto_stage)
    }

    
    @objc func brock_fix(){
        print("fix")
        for_i :for y in 0..<19{
            for x in 0..<11{
                if(teto_stage[19-y][11-x] < 10 && teto_stage[19-y][11-x] != 0){
                    teto_stage[19-y][11-x]=teto_stage[19-y][11-x] * 10
                }
            }
        }
    }
    
    @objc func brock_serch(){
        var br_counter = 0
        print("brock serch")
        for y in 0..<19{
            for x in 0..<11{
                if(teto_stage[y][x] < 10 && teto_stage[y][x] != 0){
                    if(br_counter == 4){
                        return
                    }
                    brock_serch_y[br_counter] = y
                    brock_serch_x[br_counter] = x
                    br_counter += 1
                }
            }
        }
        print("brock_serch_x\(brock_serch_x),brock_serch_y\(brock_serch_y)copy")
    }
    //左ボタン
    @IBAction func left(_ sender: Any) {
        idou_flg = 1
        print("Push left Botan")
        brock_serch()
        for i in 0..<4{
            if(brock_serch_x[i] == 0){
                return
            }
            if((teto_stage[brock_serch_y[i]][brock_serch_x[i]-1] != 0 && teto_stage[brock_serch_y[i]][brock_serch_x[i]-1] != teto_stage[brock_serch_y[i]][brock_serch_x[i]] )){
                print("left_exist brock")
                return
            }
        }
        var tmp = 0
        tmp = teto_stage[brock_serch_y[0]][brock_serch_x[0]]
        
        for i in 0..<4{
            teto_stage[brock_serch_y[i]][brock_serch_x[i]] = 0
        }
        for v in view.subviews{
            if let v = v as? UIView, v.tag == 1{
                v.removeFromSuperview()
            }
        }
        
        for i in 0..<4{
            teto_stage[brock_serch_y[i]][brock_serch_x[i]-1] = tmp
        }
        brock_draw()
        return
    }
    //右ボタン
    @IBAction func right(_ sender: Any) {
        idou_flg = 1
        print("Push right Botan")
        brock_serch()
        for i in 0..<4{
            if(brock_serch_x[i] == 11){
                return
            }
            if((teto_stage[brock_serch_y[i]][brock_serch_x[i]+1] != 0 && teto_stage[brock_serch_y[i]][brock_serch_x[i]+1] != teto_stage[brock_serch_y[i]][brock_serch_x[i]] )){
                print("right_exist brock")
                return
            }
        }
        var tmp = 0
        tmp = teto_stage[brock_serch_y[0]][brock_serch_x[0]]
        
        for i in 0..<4{
            teto_stage[brock_serch_y[i]][brock_serch_x[i]] = 0
        }
        for v in view.subviews{
            if let v = v as? UIView, v.tag == 1{
                v.removeFromSuperview()
            }
        }
        for i in 0..<4{
            teto_stage[brock_serch_y[i]][brock_serch_x[i]+1] = tmp
        }
        brock_draw()
        return
    }
    //下ボタン
    @IBAction func under(_ sender: Any) {
        print("Push sita Botan")
        print(teto_stage)
        //落ちてくるブロックの一番したと着地できる場所の距離
        var min = 100
        var sita_brock = 0
        
         counter2 = 0
         brock_serch()
         for i in 0..<4{
             if(brock_serch_y[i] == 0){
                 print("sita_break1")
                 brock_fix()
                brock_draw()
                 var brock_Value = Int.random(in: 1 ... 7)
                 brock_create(brock_Value: brock_Value)
                 return
             }
         }
        
         //動いているブロックから下までの距離を測定
         //printするために先に定義
         var yy = 0
        for i in 0..<4{
            print("i=\(i)")
            for_i :for yy in brock_serch_y[i]..<20{
                print("a:i=\(i)/yy=\( yy)/min=\(min)/yy-bro=\( yy  -  brock_serch_y[i])")
                 if(teto_stage[yy][brock_serch_x[i]] >= 10 ){
                     sita_brock += 1
                     if(min > yy - brock_serch_y[i]  ){
                         min = yy - brock_serch_y[i]
                        print("b:i=\(i)/yy=\( yy)/min=\(min)/yy-bro=\( yy  -  brock_serch_y[i])")
                         break for_i
                     }
                 }
             }
         }
         //一番下まで落下
         if(sita_brock == 0){
             print("max_down")
             var max_serch_y = -1
             for n in 0..<4{
                 //動いている中で一番したにあるブロックのyを探す。
                 if(max_serch_y < brock_serch_y[n]){
                 max_serch_y = brock_serch_y[n]
                 }
             }
             
             for i in 0..<4{
                teto_stage[brock_serch_y[i] + 20 - max_serch_y][brock_serch_x[i]]=teto_stage[brock_serch_y[i]][brock_serch_x[i]] * 10
                 
                 teto_stage[brock_serch_y[i]][brock_serch_x[i]] = 0
             }
            print("max_serch_y = \(20 - max_serch_y)")
            brock_draw()
             var brock_Value = Int.random(in: 1 ... 7)
             brock_create(brock_Value: brock_Value)
             return
         }
        
         print("min = \(min)")
         
         //minの距離-1分落とす
         min -= 1
        
        print("min-1 = \(min)")
         for k in 0..<4{
             print("down")
            teto_stage[brock_serch_y[k]+min][brock_serch_x[k]] = teto_stage[brock_serch_y[k]][brock_serch_x[k]] * 10
             teto_stage[brock_serch_y[k]][brock_serch_x[k]] = 0
             
         }
         print("^^^^^^^^^^^^^^^^^")
         print(teto_stage)
        brock_draw()
         var brock_Value = Int.random(in: 1 ... 7)
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
