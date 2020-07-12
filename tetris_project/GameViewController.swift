//
//  GameViewController.swift
//  tetris_project
//
//  Created by 田中勇気 on 2020/05/26.
//  Copyright © 2020 IOSapplication_time. All rights reserved.

//brock.tag tag = 1 なら削除。現状全削除
//teto_stage の数値に色情報を持たせる　１０未満なら動いている１０以上なら固定されている
//teto_stage の判断のためにランダム範囲0~7を1~7に変更

//teto_stageのyの３より上にブロックがあったらメニューに移動

import UIKit
import SwiftUI
import SpriteKit
import GameplayKit
import AVFoundation

var animator : UIDynamicAnimator!
var audioPlayerBGM_G:AVAudioPlayer!
var audioPlayerSE_G:AVAudioPlayer!
var brock_Value = Int.random(in: 1 ... 7)

var br_count = 0

var brock_serch_y = [0,0,0,0]
var brock_serch_x = [0,0,0,0]

var brock_turn_y = [0,0,0,0]
var brock_turn_x = [0,0,0,0]

var tmp_color = 0;

class GameViewController: UIViewController,AVAudioPlayerDelegate {
    
    @IBOutlet weak var TimeLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    
    
    //ブロックを定義
    var brock : UIView!
    //終了変数
    var finish:Bool = false
    //test用の変数
    var counter:Int = 0
    //test用の変数2
    var counter2:Int = 0
    //重力タイマー用変数
    var gTime = Timer()
    //制限時間タイマー用変数
    var Time = Timer()
    //制限時間の変数
    var timecounter = 60
    //得点用の変数
    var score = 0
    var scoreLabel:SKLabelNode?
    var scorelist = [100,200,300,400,800,1000,1500]
    //pauseからの戻りを判定する変数
    var Backfrompause :Bool!
    
    var idou_flg = 0
    
    //回転数
    var turn_counter = 0
    
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
    [0,1,0,0],
    //1
    [0,0,0,0],
    [0,0,0,0],
    [1,1,1,1],
    [0,0,0,0],
    //2
    [0,1,0,0],
    [0,1,0,0],
    [0,1,0,0],
    [0,1,0,0],
    //3
    [0,0,0,0],
    [0,0,0,0],
    [1,1,1,1],
    [0,0,0,0]
    //4
    ]
    
    
    var Tzi = [
       [0,0,0,0],
       [0,1,0,0],
       [1,1,1,0],
       [0,0,0,0],
       //1
       [0,1,0,0],
       [0,1,1,0],
       [0,1,0,0],
       [0,0,0,0],
       //2
       [0,0,0,0],
       [1,1,1,0],
       [0,1,0,0],
       [0,0,0,0],
       //3
       [0,0,1,0],
       [0,1,1,0],
       [0,0,1,0],
       [0,0,0,0]
        //4
    ]
       
    
    var Lzi = [
        [0,1,0,0],
        [0,1,0,0],
        [0,1,1,0],
        [0,0,0,0],
        //1
        [0,0,0,0],
        [1,1,1,0],
        [1,0,0,0],
        [0,0,0,0],
        //2
        [0,1,1,0],
        [0,0,1,0],
        [0,0,1,0],
        [0,0,0,0],
        //3
        [0,0,1,0],
        [1,1,1,0],
        [0,0,0,0],
        [0,0,0,0]
        //4
        ]
    
    var Jzi = [
        [0,0,1,0],
        [0,0,1,0],
        [0,1,1,0],
        [0,0,0,0],
        //1
        [0,1,0,0],
        [0,1,1,1],
        [0,0,0,0],
        [0,0,0,0],
        //2
        [0,1,1,0],
        [0,1,0,0],
        [0,1,0,0],
        [0,0,0,0],
        //3
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0],
        [0,0,0,0]
        //4
        ]
    
    var Szi = [
        [0,0,0,0],
        [0,1,1,0],
        [1,1,0,0],
        [0,0,0,0],
        //1
        [0,1,0,0],
        [0,1,1,0],
        [0,0,1,0],
        [0,0,0,0],
        //2
        [0,0,0,0],
        [0,1,1,0],
        [1,1,0,0],
        [0,0,0,0],
        //3
        [0,1,0,0],
        [0,1,1,0],
        [0,0,1,0],
        [0,0,0,0]
        //4
        ]
    
    var Zzi = [
        [0,0,0,0],
        [0,1,1,0],
        [0,0,1,1],
        [0,0,0,0],
        //1
        [0,0,1,0],
        [0,1,1,0],
        [0,1,0,0],
        [0,0,0,0],
        //2
        [0,0,0,0],
        [0,1,1,0],
        [0,0,1,1],
        [0,0,0,0],
        //3
        [0,0,1,0],
        [0,1,1,0],
        [0,1,0,0],
        [0,0,0,0]
        //4
    ]
    
    var Ozi = [
        [0,0,0,0],
        [0,1,1,0],
        [0,1,1,0],
        [0,0,0,0],
        //1
        [0,0,0,0],
        [0,1,1,0],
        [0,1,1,0],
        [0,0,0,0],
        //2
        [0,0,0,0],
        [0,1,1,0],
        [0,1,1,0],
        [0,0,0,0],
        //3
        [0,0,0,0],
        [0,1,1,0],
        [0,1,1,0],
        [0,0,0,0],
        //4
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
             print(bar)
             for i in 0..<16{
                 for n in 0..<4{
                     print("bar i=\(i)/n=\(n) bar[i][n]=\(bar[i][n])")
                 }
             }
             print("------------")
             for i in 0..<16{
                 for n in 0..<4{
                     print("Tzi i=\(i)/n=\(n) Tzi[i][n]=\(Tzi[i][n])")
                 }
             }
             */
        
        //ブロックを生成
        //生成の基本関数
        //let brock_Value = Int.random(in: 1 ... 7)
        brock_create(brock_Value: brock_Value)

//重力時間
        gTime = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(GameViewController.gravity), userInfo: nil, repeats: true)
//制限時間
        Time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.timer), userInfo: nil, repeats: true)

        playBGM(name : "GameBGM")
        //bgm読み込み
        audioPlayerBGM_G.numberOfLoops = -1
        //ループ
    }
 
    
    override func viewWillAppear(_ animated: Bool) {
              super.viewWillAppear(animated)

           Bfp()
        
       }
    
       func Bfp(){
       if (Backfrompause == true){
        playSE(name : "ModalSE")
        audioPlayerBGM_G.play()
        audioPlayerBGM_G.numberOfLoops = -1
        //bgmを再開
        Backfrompause = false
//重力時間(再開用)
        gTime = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(GameViewController.gravity), userInfo: nil, repeats: true)
//制限時間(再開用)
        Time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameViewController.timer), userInfo: nil, repeats: true)
       }
    }
    
    
 //ブロック生成
 @objc func brock_create(brock_Value:Int){
     counter2 = 0
        if(brock_Value == 1){
            for i in 0..<4{
                        for j in 0..<4{
                            if(bar[i][j] == 1){
                                teto_stage[4-i][8-j] = 1
                            }
                        }
                    }
            return
        }
    
        if(brock_Value == 2){
             for i in 0..<4{
                       for j in 0..<4{
                            if(Tzi[i][j] == 1){
                               teto_stage[4-i][8-j] = 2
                            }
                       }
                   }
            return
        }
        if(brock_Value == 3){
             for i in 0..<4{
                          for j in 0..<4{
                               if(Lzi[i][j] == 1){
                                  teto_stage[4-i][8-j] = 3
                               }
                          }
                      }
            return
        }
        if(brock_Value == 4){
            for i in 0..<4{
                for j in 0..<4{
                     if(Jzi[i][j] == 1){
                        teto_stage[4-i][8-j] = 4
                     }
                }
            }
            return
        }
        if(brock_Value == 5){
             for i in 0..<4{
                          for j in 0..<4{
                               if(Szi[i][j] == 1){
                                  teto_stage[4-i][8-j] = 5
                               }
                          }
                      }
            return
        }
        if(brock_Value == 6){
            for i in 0..<4{
                for j in 0..<4{
                     if(Zzi[i][j] == 1){
                        teto_stage[4-i][8-j] = 6
                     }
                }
            }
            return
        }
        if(brock_Value == 7){
            for i in 0..<4{
                for j in 0..<4{
                     if(Ozi[i][j] == 1){
                        teto_stage[4-i][8-j] = 7
                     }
                }
            }
            return
        }
       
    }
    
    @objc func brock_draw(){
        for v in view.subviews{
            if let v = v as? UIView, v.tag == 1{
                v.removeFromSuperview()
            }
        }
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
    
    for v in view.subviews{
        if let v = v as? UIView, v.tag == 1{
            v.removeFromSuperview()
        }
    }
    
    brock_draw()
    
    counter2 += 1
    print("counter2 = \(counter2)")
    
    brock_gravity()
    brock_line_delete()
    
    for y in 0..<3{
        for x in 0..<11{
            if(teto_stage[y][x] >= 10){
                print("Game Over")
                gTime.invalidate()
                Time.invalidate()
                audioPlayerBGM_G.stop()
                self.performSegue(withIdentifier: "moveEnd", sender: self)
            }
        }
    }
}

//制限時間
    @objc func timer(){
        TimeLabel.text = String(timecounter)
            //制限時間の表示

        if(timecounter == 0){
                gTime.invalidate()
                 Time.invalidate()
                audioPlayerBGM_G.stop()
                self.performSegue(withIdentifier: "moveEnd2", sender: self)
            }
         //0秒になったらタイマーを停止して終了画面へ移動

        timecounter -= 1
            //制限時間カウント
        //練習でスコアも加算してみる
        //score += 10
        
        //ScoreLabel.text = String(score)

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
                        var brock_Value = Int.random(in: 1 ... 7)
                            brock_create(brock_Value: brock_Value)
                        return
                       }//それ以外の場合、ブロックが１つ下に下がる
                       else{
                           br_count += 1
                          
                               bro_y[br_count-1] = y
                               bro_x[br_count-1] = x
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
    //print(teto_stage)
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
        for y in 0..<20{
            for x in 0..<12{
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
    
    @objc func brock_line_delete(){
        var line_flg = 0
        print("delete_line")
        for y in 0..<20{
            for x in 0..<12{
                if(teto_stage[19 - y][x] >= 10){
                    line_flg += 1
                    //print("line_flg\(line_flg)")
                    if(line_flg == 12){
                    //点数が増える
                    score += 10
                    ScoreLabel.text = String(score)
                    //ブロックが消える
                        print("delete_start")
                        for yy in 0..<19 - y{
                            for xx in 0..<12{
                                teto_stage[19 - y - yy][xx] = teto_stage[19 - y - yy - 1][xx]
                                print("y = \(y) x = \(x) yy = \(yy) xx = \(xx) y - yy = \(y-yy)")
                                //print("19 - yy = \(19-yy)")
                            }
                        }
                    }
                    for v in view.subviews{
                        if let v = v as? UIView, v.tag == 1{
                               v.removeFromSuperview()
                        }
                    }
                }
            }
            line_flg = 0
        }
        print(teto_stage)
        brock_draw()
    }
    
    //左ボタン
    @IBAction func left(_ sender: Any) {
        idou_flg = 1
        print("Push left Botan")
        brock_serch()
        for i in 0..<4{
            if(brock_serch_x[i] == 0){
                print("already_left_max")
                return
            }
        }
            for i in 0..<4{
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
/*
        for v in view.subviews{
            if let v = v as? UIView, v.tag == 1{
                v.removeFromSuperview()
            }
        }
 */
        
        for i in 0..<4{
            teto_stage[brock_serch_y[i]][brock_serch_x[i]-1] = tmp
        }
        brock_draw()
        brock_line_delete()
        return
    }
    //右ボタン
    @IBAction func right(_ sender: Any) {
        idou_flg = 1
        print("Push right Botan")
        brock_serch()
        for i in 0..<4{
            if(brock_serch_x[i] == 11){
            print("already_right_max")
            return
            }
        }
        
        for i in 0..<4{
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
/*
        for v in view.subviews{
            if let v = v as? UIView, v.tag == 1{
                v.removeFromSuperview()
            }
        }
*/
        
        for i in 0..<4{
            teto_stage[brock_serch_y[i]][brock_serch_x[i]+1] = tmp
        }
        brock_draw()
        brock_line_delete()
        return
    }
    //下ボタン
    @IBAction func under(_ sender: Any) {
        print("Push sita Botan")
        //print(teto_stage)
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
                brock_line_delete()
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
                 if(yy == 19 || teto_stage[yy + 1][brock_serch_x[i]] >= 10){
                     sita_brock += 1
                     if(min > yy - brock_serch_y[i]  ){
                         min = yy - brock_serch_y[i]
                        print("b:i=\(i)/yy=\( yy)/min=\(min)/yy-bro=\( yy  -  brock_serch_y[i])")
                         break for_i
                     }
                 }
             }
         }

        
         print("min = \(min)")
         
         //minの距離-1分落とす
         //min -= 1
/*
        for v in view.subviews{
            if let v = v as? UIView, v.tag == 1{
                v.removeFromSuperview()
            }
        }
 */
        var tmp_color = 0;
        tmp_color = teto_stage[brock_serch_y[0]][brock_serch_x[0]]
        
        print("brock_serch_x\(brock_serch_x),brock_serch_y\(brock_serch_y)copy")
         for k in 0..<4{
             print("down")
            if(min == 0){
                print("break_min == 0")
                brock_fix()
                break
            }
            teto_stage[brock_serch_y[k]][brock_serch_x[k]] = 0
            teto_stage[brock_serch_y[k]+min][brock_serch_x[k]] = tmp_color * 10
            
         }
         
         print("^^^^^^^^^^^^^^^^^")
         print(teto_stage)
        brock_draw()
        brock_line_delete()
         var brock_Value = Int.random(in: 1 ... 7)
         brock_create(brock_Value: brock_Value)
        
        
    }
    
    @IBAction func turn(_ sender: Any) {
        print("push turn button")
        var tmppp = 0
        //回転の原点とりあえず3つ目
        var center = 2
        brock_serch()
        tmppp = teto_stage[brock_serch_y[0]][brock_serch_x[0]]
        for i in 0..<4{
            brock_turn_x[i] = brock_serch_y[i] - brock_serch_y[2]
            brock_turn_y[i] = (brock_serch_x[i] - brock_serch_x[2]) * -1
            if(i==2){
                brock_turn_x[2] = 0
                brock_turn_y[2] = 0
            }
        }
        print("brock_serch_x = \( brock_serch_x)  brock_serch_y = \(brock_serch_y) brock_turn_x = \(brock_turn_x) brock_turn_y = \( brock_turn_y) ")
        for a in 0..<4{
            print("move_point_x = \(brock_serch_x[2] +  brock_turn_x[a])move_point_y = \((brock_serch_y[2] +  brock_turn_y[a]))")
        }
            for c in 0..<4{
                if(brock_serch_y[2] + brock_turn_y[c] < 0 || brock_serch_y[2] + brock_turn_y[c] > 19 || brock_serch_x[2] + brock_turn_x[c] < 0 || brock_serch_x[2] + brock_turn_x[c] >= 11 || teto_stage[brock_serch_y[2] +  brock_turn_y[c]][brock_serch_x[2] + brock_turn_x[c]] != 0 && teto_stage[brock_serch_y[2] +  brock_turn_y[c]][brock_serch_x[2] + brock_turn_x[c]] != tmppp){
                    print("can't turn")
                    return
                }
            }
          print("turn start")
            for d in 0..<4{
                       teto_stage[brock_serch_y[d]][brock_serch_x[d]] = 0
                }
        
            for c in 0..<4{
                teto_stage[brock_serch_y[2] +  brock_turn_y[c]][brock_serch_x[2] + brock_turn_x[c]] = tmppp
        }
        brock_draw()
    }
    
    
    
    @IBAction func pause(_ sender: Any) {
        gTime.invalidate()
        Time.invalidate()
        //タイマーの停止
        audioPlayerBGM_G.pause()
        //bgm一時停止
        playSE(name : "ModalSE")
        
    self.performSegue(withIdentifier: "moveModal", sender: self)
    }
    //pause画面を表示
    
    
    func playBGM(name: String) {
        guard let path = Bundle.main.path(forResource: name, ofType: "mp3") else {
            print("音源ファイルが見つかりません")
            return
        }//GameBGM.mp3までのパスを取得

        do {
            
            audioPlayerBGM_G = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            //パスからBGM再生のURLを作成
            // AVAudioPlayerをインスタンス化

            
            audioPlayerBGM_G.play()
            // URLを実行
            
        } catch {
            //エラーが発生した場合の処理
        }
    }

    func playSE(name: String) {
        guard let path = Bundle.main.path(forResource: name, ofType: "mp3") else {
                print("音源ファイルが見つかりません")
                return
            }//ModalSE.mp3までのパスを取得

            do {
                
                audioPlayerSE_G = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                //パスからBGM再生のURLを作成
                // AVAudioPlayerをインスタンス化

                
                audioPlayerSE_G.play()
                // URLを実行
                
            } catch {
                //エラーが発生した場合の処理
            }
        
    
}
}
