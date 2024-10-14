//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var Content: UILabel!
    @IBOutlet weak var process: UIProgressView!
    let eggTimes = ["Soft": 5 * 1, "Medium": 7 * 1, "Hard": 12 * 1]
    var player: AVAudioPlayer!
    var timer = Timer()
    var passingTime = 0
    var totalTime = 0
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        timer.invalidate()
        process.progress = 0
        passingTime = 0
        totalTime = eggTimes[hardness]!
        Content.text = "\(hardness) eggs are cooking"
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }

    @objc func update() {
        if(passingTime != totalTime) {
            passingTime += 1
            process.progress = Float(passingTime) / Float(totalTime)
        }
        else{
            timer.invalidate()
            Content.text = "DONE!!!"
            playSound(soundName: "alarm_sound")
        }
    }
    
    func playSound(soundName: String){
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
