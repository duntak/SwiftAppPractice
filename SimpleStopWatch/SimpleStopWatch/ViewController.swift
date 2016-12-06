//
//  ViewController.swift
//  SimpleStopWatch
//
//  Created by Cao Liang on 6/12/16.
//  Copyright © 2016 Cao Liang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!

    //Point 1:  Change Style改变风格
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.lightContent
    }
    
    //Point 2: Hide StatusBar 隐藏状态列
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    //Point 3: timer set up
    var seconds = 0.0
    var timer = Timer()
    var timerIsOn = false
    
    @IBAction func playButtonAction(_ sender: UIButton) {
        //When timer is playing, PlayButton will not work
        if timerIsOn{
            return
        }
        
        //Timer is going to start playing
        playButton.isEnabled = false    //Inavtivate playButton
        pauseButton.isEnabled = true    //Activate pauseButton
        timerIsOn = true                //Timer start to play
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
        
    }
    
    func updateTimer(){
        seconds += 0.1
        timeLabel.text = String(format: "%.1f", seconds)
    }
    
    //Point 4: timer pause
    @IBAction func pauseButtonAction(_ sender: UIButton) {
        playButton.isEnabled = true     //Activate playButton
        pauseButton.isEnabled = false   //Inactivate pauseButton
        timer.invalidate()      //Stop the timer
        timerIsOn = false
    }
    
    //Point 5: timer set
    @IBAction func resetButtonAction(_ sender: UIButton) {
        timer.invalidate()  //Stop the timer
        timerIsOn = false   //Off the timer
        seconds = 0
        timeLabel.text = String(seconds)
        playButton.isEnabled = true
        pauseButton.isEnabled = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Point 6: set up label 
        timeLabel.text = String(seconds)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

       
}

