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
    
    
        //MARK: app load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set the image for the slider normal state
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, forState: .Normal)
        
        //set the image for the slider highlighted state
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, forState: .Highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        //These allow the slider bar to show up green and white
        if let leftTrackImage = UIImage(named: "SliderTrackLeft") {
            let trackLeftResizable = leftTrackImage.resizableImageWithCapInsets(insets)
            slider.setMinimumTrackImage(trackLeftResizable, forState: .Normal)
        }
        
        if let rightTrackImage = UIImage(named: "SliderTrackRight") {
            let trackRightResizable = rightTrackImage.resizableImageWithCapInsets(insets)
            slider.setMaximumTrackImage(trackRightResizable, forState: .Normal)
        }
        
        
        startNewRound()
    }
    //MARK: Actions
    @IBAction func showAlert(){
        let difference = 100 - abs(targetValue - currentValue)
        totalScore += difference
        let alert = UIAlertController(title: "Well done", message: "You hit \(currentValue) and scored \(difference)", preferredStyle: .Alert)
        
        
        //Define the alert and what happens when its OK button is clicked
        //Inside a closure, you have to use self to refer to this view controller
        //The handler is what happens when the OK button is clicked
        let action = UIAlertAction(title: "OK", style: .Default, handler: {action in self.startNewRound()})
        
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func sliderMoved(slider: UISlider){
        currentValue = lroundf(slider.value)
        
    }
    @IBAction func startAgain(startAgain: UIButton){
        roundNumber = 0
        totalScore = 0
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

