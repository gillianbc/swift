//
//  ViewController.swift
//  BullsEye
//
//  Created by test on 25/08/2016.
//  Copyright © 2016 test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue :Int = 50
    var targetValue: Int = 1
    var totalScore: Int = 0
    var roundNumber: Int = 0
    //MARK: Outlets
    @IBOutlet weak var slider:UISlider!
    @IBOutlet weak var target: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var round: UILabel!
    //MARK: Actions
    @IBAction func showAlert(){
        let difference = 100 - abs(targetValue - currentValue)
        totalScore += difference
        let alert = UIAlertController(title: "Well done", message: "You scored \(difference) target \(targetValue)", preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: {action in self.startNewRound()})
        
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
      
    }
    
    @IBAction func sliderMoved(slider: UISlider){
        currentValue = lroundf(slider.value)
        
    }
    //MARK: app load
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }
    
    //MARK: Utility methods
    func startNewRound(){
        setTargetValue()
        currentValue = 50
        slider.value = Float(currentValue)
        roundNumber += 1
        updateLabels()

    }
    
    func updateLabels(){
        target.text = String(targetValue)
        score.text = String(totalScore)
        round.text = String(roundNumber)
    }

    func setTargetValue(){
        
        targetValue = 1 + Int(arc4random_uniform(100))
    }

}

