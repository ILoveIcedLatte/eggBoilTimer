//
//  ViewController.swift
//  boilEgg
//
//  Created by Dilara Şimşek on 7.06.2022.
//

import UIKit

enum BoilType {
    case fullyHard, hard, medium, soft
}

class eggBoilSelection: UIViewController {
    
    @IBOutlet weak var btnFullyHard: UIButton!
    
    @IBOutlet weak var btnHard: UIButton!
    
    @IBOutlet weak var btnMedium: UIButton!
    
    @IBOutlet weak var btnSoft: UIButton!
    
    var boilTime : Int = 0
    
    var boilType : BoilType = .fullyHard
    
    private let fullyHardImgView: UIImageView = {
       
        let imageView = UIImageView()
        imageView.image = UIImage(named: "fullyHardBoil")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
    private let fullHardButton: UIButton = {
       
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
        
    }()
    
    private let hardImgView: UIImageView = {
       
        let imageView = UIImageView()
        imageView.image = UIImage(named: "hardBoil")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
    private let hardButton: UIButton = {
       
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
        
    }()
    
    private let mediumImgView: UIImageView = {
       
        let imageView = UIImageView()
        imageView.image = UIImage(named: "mediumBoil")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
    private let mediumButton: UIButton = {
       
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
        
    }()
    
    private let softImgView: UIImageView = {
       
        let imageView = UIImageView()
        imageView.image = UIImage(named: "softBoil")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
    private let softButton: UIButton = {
       
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
        
    }()
    
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(fullyHardImgView)
        view.addSubview(fullHardButton)
        
        view.addSubview(hardImgView)
        view.addSubview(hardButton)
        
        view.addSubview(mediumImgView)
        view.addSubview(mediumButton)
        
        view.addSubview(softImgView)
        view.addSubview(softButton)
        
        view.backgroundColor = .white
        
        
        fullHardButton.tag = 0
        hardButton.tag = 1
        mediumButton.tag = 2
        softButton.tag = 3
        
        
        fullHardButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        hardButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        mediumButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        softButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        applyConstraints()
        
        
    }
    
    func applyConstraints() {
        
        let fullyHardBoilConst = [
            fullyHardImgView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            fullyHardImgView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            fullyHardImgView.bottomAnchor.constraint(equalTo: fullyHardImgView.bottomAnchor),
            fullyHardImgView.widthAnchor.constraint(equalToConstant: 100),
            fullyHardImgView.heightAnchor.constraint(equalToConstant: 100)
        ]
        
        NSLayoutConstraint.activate(fullyHardBoilConst)
        
        
        let fullyHardBoilButtonConst = [
            fullHardButton.topAnchor.constraint(equalTo: fullyHardImgView.topAnchor),
            fullHardButton.leadingAnchor.constraint(equalTo: fullyHardImgView.leadingAnchor),
            fullHardButton.trailingAnchor.constraint(equalTo: fullyHardImgView.trailingAnchor),
            fullHardButton.bottomAnchor.constraint(equalTo: fullyHardImgView.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(fullyHardBoilButtonConst)
        
        
        let hardBoilConst = [
            hardImgView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            hardImgView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            hardImgView.widthAnchor.constraint(equalToConstant: 100),
            hardImgView.heightAnchor.constraint(equalToConstant: 100)
        ]
        
        NSLayoutConstraint.activate(hardBoilConst)
        
        
        let hardBoilButtonConst = [
            hardButton.topAnchor.constraint(equalTo: hardImgView.topAnchor),
            hardButton.leadingAnchor.constraint(equalTo: hardImgView.leadingAnchor),
            hardButton.trailingAnchor.constraint(equalTo: hardImgView.trailingAnchor),
            hardButton.bottomAnchor.constraint(equalTo: hardImgView.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(hardBoilButtonConst)
        
        let mediumBoilConst = [
            mediumImgView.topAnchor.constraint(equalTo: fullyHardImgView.bottomAnchor, constant: 20),
            mediumImgView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            mediumImgView.widthAnchor.constraint(equalToConstant: 100),
            mediumImgView.heightAnchor.constraint(equalToConstant: 100)
        ]
        
        NSLayoutConstraint.activate(mediumBoilConst)
        
        
        let mediumBoilButtonConst = [
            mediumButton.topAnchor.constraint(equalTo: mediumImgView.topAnchor),
            mediumButton.leadingAnchor.constraint(equalTo: mediumImgView.leadingAnchor),
            mediumButton.trailingAnchor.constraint(equalTo: mediumImgView.trailingAnchor),
            mediumButton.bottomAnchor.constraint(equalTo: mediumImgView.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(mediumBoilButtonConst)
        
        let softBoilConst = [
            softImgView.topAnchor.constraint(equalTo: hardImgView.bottomAnchor, constant: 20),
            softImgView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            softImgView.widthAnchor.constraint(equalToConstant: 100),
            softImgView.heightAnchor.constraint(equalToConstant: 100)
        ]
        
        NSLayoutConstraint.activate(softBoilConst)
        
        
        let softBoilButtonConst = [
            softButton.topAnchor.constraint(equalTo: softImgView.topAnchor),
            softButton.leadingAnchor.constraint(equalTo: softImgView.leadingAnchor),
            softButton.trailingAnchor.constraint(equalTo: softImgView.trailingAnchor),
            softButton.bottomAnchor.constraint(equalTo: softImgView.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(softBoilButtonConst)
        
        
        
    }
    
    func navigateParameters(type: BoilType, time: Int) {
        
        let eggTimerPage = eggBoilTimer()
        
        eggTimerPage.boilType = type
        eggTimerPage.boilTime = time
        
        self.navigationController?.pushViewController(eggTimerPage, animated: true)
        
        /*
        let eggTimerPage = Storyboards.main.instantiateViewController(withIdentifier: "eggBoilTimer") as! eggBoilTimer
        
        eggTimerPage.boilType = type
        eggTimerPage.boilTime = time
                    
        self.navigationController?.pushViewController(eggTimerPage, animated: true) */
        
    }
    
    
    @objc func buttonTapped(sender: UIButton) {
        
        
        switch sender.tag {
        case 0:
            navigateParameters(type: .fullyHard, time: 600)
            
        case 1:
            navigateParameters(type: .hard, time: 420)
            
        case 2:
            navigateParameters(type: .medium, time: 300)
            
        case 3:
            navigateParameters(type: .soft, time: 240)
            
        default:
            print("default")
        
        }
        

    }
    
    
}

