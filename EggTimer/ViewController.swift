//
//  ViewController.swift
//  EggTimer
//
//  Created by Satyam Kumar on 29/06/21.
//

import UIKit
import AVFoundation

var player: AVAudioPlayer?

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var textLabel: UILabel!
    let eggTimes = ["Soft" : 300 , "Medium" : 420 , "Hard" : 720]
    
    var totalTime = 0
    var secondsPassed = 0

    var timer = Timer()
    
    @IBAction func hardnessSelector(_ sender: UIButton) {
        
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        totalTime = eggTimes[hardness]!
        progressBar.progress = 0.0
        secondsPassed = 0
        textLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
//        print(result)
    
        
        }
    
    @objc func updateCounter() {
        //example functionality
        if secondsPassed <= totalTime {
            
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            
            
            
        } else {
            timer.invalidate()
            textLabel.text = "Done"
            let path = Bundle.main.path(forResource: "alarm_sound", ofType : "mp3")!
                let url = URL(fileURLWithPath : path)
                do {
                    player = try AVAudioPlayer(contentsOf: url)
                    player?.play()
                } catch {
                    print ("There is an issue with this code!")
                }
        }
    }
    
    
}




