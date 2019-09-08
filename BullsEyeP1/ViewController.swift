//
//  ViewController.swift
//  BullsEyeP1
//
//  Created by Karolina Lubieniecka-Kocon on 08/09/2019.
//  Copyright © 2019 PawelKocon. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var numSlider: UISlider!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var exactSwitch: UISwitch!
    @IBOutlet weak var playAgainButton: UIButton!
    
    var counter = 0
    var randomNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        randomNumber = Int(arc4random_uniform(101))
        numLabel.text = "Move the slider to \(randomNumber)"
    }


    @IBAction func checkValue(_ sender: Any) {
        
        if exactSwitch.isOn == false {
            
            if  Int(numSlider.value) >= randomNumber - 3 && Int(numSlider.value) < randomNumber + 3 {
                 resultLabel.text = "You were right on point! Bullseye!"
                resultLabel.backgroundColor = UIColor.green
            } else {
                resultLabel.text = "Whoops! You've missed! Try again!"
                resultLabel.backgroundColor = UIColor.red
            }
        } else {
        
            if randomNumber == Int(numSlider.value) {
                resultLabel.text = "You were right on point! Bullseye!"
                resultLabel.backgroundColor = UIColor.green
            } else {
                resultLabel.text = "Whoops! You've missed! Try again!"
                resultLabel.backgroundColor = UIColor.red
            }
        }
        
        resultLabel.isHidden = false
        playAgainButton.isHidden = false
    }
    
    
    @IBAction func playAgain(_ sender: Any) {
        
        numSlider.setValue(50.0, animated: false)
        randomNumber = Int(arc4random_uniform(101))
        numLabel.text = "Move the slider to \(randomNumber)"
        resultLabel.isHidden = true
        playAgainButton.isHidden = true
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
    }
}

