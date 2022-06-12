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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        btnFullyHard.tag = 0
        btnHard.tag = 1
        btnMedium.tag = 2
        btnSoft.tag = 3
        
        
        btnFullyHard.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        btnHard.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        btnMedium.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        btnSoft.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        
    }
    
    func navigateParameters(type: BoilType, time: Int) {
        
        let eggTimerPage = Storyboards.main.instantiateViewController(withIdentifier: "eggBoilTimer") as! eggBoilTimer
        
        eggTimerPage.boilType = type
        eggTimerPage.boilTime = time
                    
        self.navigationController?.pushViewController(eggTimerPage, animated: true)
        
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

