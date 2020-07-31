//
//  StartCountViewController.swift
//  tetris_project
//
//  Created by 栗田桂佑 on 2020/07/20.
//  Copyright © 2020 IOSapplication_time. All rights reserved.
//

import UIKit
import AVFoundation

var audioPlayerSE_C:AVAudioPlayer!

class StartCountViewController: UIViewController {

    
    
    @IBOutlet weak var CountLabel: UILabel!
    var Startcounter = 3
    var Counttime = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       Counttime = Timer.scheduledTimer(timeInterval: 1, target: self, selector:#selector(StartCountViewController.Count), userInfo: nil, repeats: true)
    }
    

   @objc func Count(){
    Startcounter -= 1
       if Startcounter > 0{
        CountLabel.text = String(Startcounter)
        playSE(name: "Countdown")
       }
       else if Startcounter == 0{
        playSE(name: "Countdown2")
         CountLabel.text = String("START")
        Counttime.invalidate()
           self.performSegue(withIdentifier: "moveGame", sender: self)
       }
   
       
       
   }
    
    func playSE(name: String) {
            guard let path = Bundle.main.path(forResource: name, ofType: "mp3") else {
                    print("音源ファイルが見つかりません")
                    return
                }//ModalSE.mp3までのパスを取得

                do {
                    
                    audioPlayerSE_C = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                    //パスからBGM再生のURLを作成
                    // AVAudioPlayerをインスタンス化

                    
                    audioPlayerSE_C.play()
                    // URLを実行
                    
                } catch {
                    //エラーが発生した場合の処理
                }
            
        
    }

}
