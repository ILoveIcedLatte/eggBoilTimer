//
//  eggBoilTimer.swift
//  boilEgg
//
//  Created by Dilara Şimşek on 11.06.2022.
//

import UIKit

class eggBoilTimer: UIViewController {
    
    @IBOutlet weak var btnBoilName: UIButton!
    
    @IBOutlet weak var slider: UISlider!
    
    
    @IBOutlet weak var lblTimer: UILabel!
    @IBOutlet weak var lblBoilName: UILabel!
    var boilTime : Int = 0
    var seconds: Int = 0
    var timer = Timer()
    var timeStarted : Bool = false
    
    var boilType : BoilType = .fullyHard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        seconds = boilTime
        
        eggName()
        lblTimer.text = String(timeString(time: TimeInterval(seconds)))
        
        startTimer()
        
        print("time: \(boilTime)")
        print("type: \(boilType)")
        // Do any additional setup after loading the view.
    }
    
    func timeString(time: TimeInterval) -> String {
        let hour = Int(time) / 3600
        let minute = Int(time) / 60 % 60
        let second = Int(time) % 60
        
        return String(format: "%02i:%02i:%02i", hour, minute, second)
    }
    
    func eggName() {
        
        switch boilType {
        case .fullyHard:
            btnBoilName.setTitle("Fully Hard Boiled", for: .normal)
            lblBoilName.text = "Fully Hard Boiled"
        case .hard:
            btnBoilName.setTitle("Hard Boiled", for: .normal)
            lblBoilName.text = "Hard Boiled"
        case .medium:
            btnBoilName.setTitle("Medium Boiled", for: .normal)
            lblBoilName.text = "Medium Boiled"
        case .soft:
            btnBoilName.setTitle("Soft Boiled", for: .normal)
            lblBoilName.text = "Soft Boiled"
        }
    }
    
    func startTimer() {
        
        slider.maximumValue = Float(boilTime)
        slider.minimumValue = 0.0
        slider.setValue(Float(boilTime), animated: true)
        
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        seconds -= 1
        lblTimer.text = String(timeString(time: TimeInterval(seconds)))
        
        
        slider.value = Float(seconds)
        
        if seconds == 0 {
            timer.invalidate()
        }
        
        
        
        print("time: \(seconds)")
        
    }
    
    
    @IBAction func sliderAction(_ sender: UISlider) {
        boilTime = Int(sender.value)
        
    }
    
    
    
    @IBAction func btnPause(_ sender: UIButton) {
        timer.invalidate()
        
    }
    
    
    @IBAction func btnContinue(_ sender: UIButton) {
        
        startTimer()
    }
    
    @IBAction func btnRestart(_ sender: UIButton) {
        
        timer.invalidate()
        
        seconds = boilTime
        lblTimer.text = String(timeString(time: TimeInterval(seconds)))
        startTimer()
            
    }
    

}
