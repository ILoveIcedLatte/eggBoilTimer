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
    
    private let backView : UIView = {
       
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow.withAlphaComponent(0.5)
        
        return view
    }()
    
    private let eggNameLabel: UILabel = {
       
        let label = UILabel()
        
        label.text = "Selected Egg Name"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    private let selectedEggNameLabel: UILabel = {
       
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    private let remainingTimeLabel: UILabel = {
       
        let label = UILabel()
        
        label.text = "Remaining Time"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
        
    }()
    
    private let remainingTimeSlider: UISlider = {
       
        let slider = UISlider()
        slider.thumbTintColor = .yellow
        slider.tintColor = .orange
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        return slider
        
    }()

    
    private let replayButton: UIButton = {
       
        let button = UIButton()
        
        let image = UIImage(systemName: "playpause", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25))
        button.tintColor = .white
        button.setImage(image, for: .normal)
        button.layer.cornerRadius = 30
        
        button.backgroundColor = .systemOrange
        button.translatesAutoresizingMaskIntoConstraints = false
        
        
        return button
        
    }()

    
    private let pauseButton: UIButton = {
       
        let button = UIButton()
        let image = UIImage(systemName: "pause", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25))
        button.tintColor = .white
        button.setImage(image, for: .normal)
        button.layer.cornerRadius = 35
        
        button.backgroundColor = .systemOrange
        button.translatesAutoresizingMaskIntoConstraints = false
        
        
        return button
        
    }()
    

    
    private let continueButton: UIButton = {
        
        let button = UIButton()
        let image = UIImage(systemName: "play", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25))
        button.tintColor = .white
        button.setImage(image, for: .normal)
        button.layer.cornerRadius = 30
        
        button.backgroundColor = .systemOrange
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
        
    }()
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(backView)
        
        backView.addSubview(eggNameLabel)
        backView.addSubview(selectedEggNameLabel)
        backView.addSubview(remainingTimeLabel)
        backView.addSubview(remainingTimeSlider)
        backView.addSubview(replayButton)
        backView.addSubview(pauseButton)
        backView.addSubview(continueButton)
        
        view.backgroundColor = .systemOrange
        
        title = "Egg Timer"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        seconds = boilTime
        
        eggName()
        remainingTimeLabel.text = String(timeString(time: TimeInterval(seconds)))
        remainingTimeSlider.addTarget(self, action: #selector(sliderValueDidChange), for: .valueChanged)
        replayButton.addTarget(self, action: #selector(btnRestart), for: .touchUpInside)
        pauseButton.addTarget(self, action: #selector(btnPause), for: .touchUpInside)
        continueButton.addTarget(self, action: #selector(btnContinue), for: .touchUpInside)
        
        startTimer()
        
        print("time: \(boilTime)")
        print("type: \(boilType)")
        
        setConstraint()
        
        // Do any additional setup after loading the view.
    }
    
    @objc func sliderValueDidChange(_ sender:UISlider)
    {
        
        seconds = Int(sender.value)
        print("Slider value changed")
        
    }
    
    func setConstraint() {
        
        let sectionViewConst = [
            backView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            backView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backView.heightAnchor.constraint(equalToConstant: 300),
            backView.widthAnchor.constraint(equalToConstant: 400)
        ]
        
        NSLayoutConstraint.activate(sectionViewConst)
        
        
        let eggNameLabelConst = [
            eggNameLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 10),
            eggNameLabel.centerXAnchor.constraint(equalTo: backView.centerXAnchor),
            eggNameLabel.heightAnchor.constraint(equalToConstant: 30)
        ]
        
        NSLayoutConstraint.activate(eggNameLabelConst)
        
        
        let selectedEggNameConst = [
            selectedEggNameLabel.topAnchor.constraint(equalTo: eggNameLabel.bottomAnchor, constant: 20),
            selectedEggNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ]
        
        NSLayoutConstraint.activate(selectedEggNameConst)
        
        let remaingTimeConst = [
            remainingTimeLabel.topAnchor.constraint(equalTo: selectedEggNameLabel.bottomAnchor, constant: 20),
            remainingTimeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ]
        
        NSLayoutConstraint.activate(remaingTimeConst)
        
        let timeSliderConst = [
            remainingTimeSlider.topAnchor.constraint(equalTo: remainingTimeLabel.bottomAnchor, constant: 20),
            remainingTimeSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            remainingTimeSlider.widthAnchor.constraint(equalToConstant: view.bounds.width - 100),
            remainingTimeSlider.heightAnchor.constraint(equalToConstant: 20.0)
        ]
        
        NSLayoutConstraint.activate(timeSliderConst)
        
        
        let replayButtonConst = [
            replayButton.topAnchor.constraint(equalTo: remainingTimeSlider.bottomAnchor, constant: 20),
            replayButton.trailingAnchor.constraint(equalTo: pauseButton.trailingAnchor, constant: 60),
            replayButton.widthAnchor.constraint(equalToConstant: 60),
            replayButton.heightAnchor.constraint(equalToConstant: 60)
        ]
        
        NSLayoutConstraint.activate(replayButtonConst)
        
        let pauseButtonConst = [
            pauseButton.topAnchor.constraint(equalTo: remainingTimeSlider.bottomAnchor, constant: 20),
            pauseButton.centerXAnchor.constraint(equalTo: remainingTimeSlider.centerXAnchor),
            pauseButton.widthAnchor.constraint(equalToConstant: 60),
            pauseButton.heightAnchor.constraint(equalToConstant: 60)
        ]
        
        NSLayoutConstraint.activate(pauseButtonConst)
        
        let continueButtonConst = [
            continueButton.topAnchor.constraint(equalTo: remainingTimeSlider.bottomAnchor, constant: 20),
            continueButton.leadingAnchor.constraint(equalTo: pauseButton.leadingAnchor, constant: -60),
            continueButton.widthAnchor.constraint(equalToConstant: 60),
            continueButton.heightAnchor.constraint(equalToConstant: 60)
        ]
        
        NSLayoutConstraint.activate(continueButtonConst)
        
        
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
            selectedEggNameLabel.text = "Fully Hard Boiled"
        case .hard:
            selectedEggNameLabel.text = "Hard Boiled"
        case .medium:
            selectedEggNameLabel.text = "Medium Boiled"
        case .soft:
            selectedEggNameLabel.text = "Soft Boiled"
        }
    }
    
    func startTimer() {
        
        remainingTimeSlider.maximumValue = Float(boilTime)
        remainingTimeSlider.setValue(Float(boilTime), animated: true)
        
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        seconds -= 1
        
        remainingTimeLabel.text = String(timeString(time: TimeInterval(seconds)))
        remainingTimeSlider.setValue(Float(seconds), animated: true)
        
        if seconds == 0 {
            timer.invalidate()
        }
        
        
        
        print("time: \(seconds)")
        
    }
    
    
    @IBAction func sliderAction(_ sender: UISlider) {
        boilTime = Int(sender.value)
        
    }
    
    
    
    @objc func btnPause(_ sender: UIButton) {
        timer.invalidate()
        
        
    }
    
    
    @objc func btnContinue(_ sender: UIButton) {
        
        timer.invalidate()
        startTimer()
    }
    
    @objc func btnRestart(_ sender: UIButton) {
        timer.invalidate()
        
        seconds = boilTime
        remainingTimeLabel.text = String(timeString(time: TimeInterval(seconds)))
        startTimer()
            
    }
    
    /*
    func showAlert() {
        let alertController: UIAlertController = UIAlertController(title: "MESSAGE", message: "ALERT", preferredStyle: .alert)
        
        let alert = UIAlertAction(title: "OK", style: .default) { _ in
            
            self.navigationController?.popToRootViewController(animated: true)
        }
        
        alertController.addAction(alert)
        self.present(alertController, animated: true, completion: nil)
    } */
    
    

    

}
