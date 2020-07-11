//
//  StartViewController.swift
//  tetris_project
//
//  Created by 栗田桂佑 on 2020/06/06.
//  Copyright © 2020 IOSapplication_time. All rights reserved.
//

import UIKit
import AVFoundation

var audioPlayerBGM_S:AVAudioPlayer!
var audioPlayerSE_S:AVAudioPlayer!

class StartViewController: UIViewController,AVAudioPlayerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        playBGM(name : "StartBGM")
        audioPlayerBGM_S.numberOfLoops = -1
        // Do any additional setup after loading the view.
    }
    
   
    
    @IBAction func tapStart(_ sender: Any){
        playSE(name : "StartSE1")
        audioPlayerBGM_S.stop()
        self.performSegue(withIdentifier: "moveGame", sender: self)
    }//ゲーム画面へ移動
    
    @IBAction func taphowto(_ sender: Any) {
        playSE(name : "StartSE1")
       self.performSegue(withIdentifier: "movehowto", sender: self)
    }//遊び方へ移動
    
    @IBAction func tapScoreRanking(_ sender: Any) {
        playSE(name : "StartSE1")
        self.performSegue(withIdentifier: "moveScoreRanking", sender: self)
    }//スコアランキングへ移動
    
    
    
    
   
    
    func playBGM(name: String) {
        guard let path = Bundle.main.path(forResource: name, ofType: "mp3") else {
            print("音源ファイルが見つかりません")
            return
        }//StartBGM.mp3までのパスを取得

        do {
            
            audioPlayerBGM_S = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            //パスからBGM再生のURLを作成
            // AVAudioPlayerをインスタンス化

            
            audioPlayerBGM_S.play()
            // URLを実行
            
        } catch {
            //エラーが発生した場合の処理
        }
    }
    
    func playSE(name: String) {
            guard let path = Bundle.main.path(forResource: name, ofType: "mp3") else {
                    print("音源ファイルが見つかりません")
                    return
                }//StartSE.mp3までのパスを取得

                do {
                    
                    audioPlayerSE_S = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                    //パスからBGM再生のURLを作成
                    // AVAudioPlayerをインスタンス化

                    
                    audioPlayerSE_S.play()
                    // URLを実行
                    
                } catch {
                    //エラーが発生した場合の処理
                }
            
        
    }

}
