//
//  FooTwoViewController.swift
//  DelegateExample
//
//  Created by test on 21/08/2016.
//  Copyright © 2016 test. All rights reserved.
//

import UIKit
protocol FooTwoViewControllerDelegate{
    func myVCDidFinish(controller:FooTwoViewController,text:String)
}
class FooTwoViewController: UIViewController {
    var colorString = "I don't know the color"
    var delegate:FooTwoViewControllerDelegate? = nil
    @IBOutlet weak var colorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        colorLabel.text = colorString
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func colourSelection(sender: UIButton) {
        
    }

    
    @IBAction func setColour(sender: UIButton) {
        colorLabel.text = sender.titleLabel!.text!
    }
    
    
    @IBAction func saveColor(sender: AnyObject) {
        guard let delegate = self.delegate else {
            print("Delegate for FooTwoDelegateController not Set")
            return
        }
        //Send a string to the delegate - the delegate will be FooOneViewController
        delegate.myVCDidFinish(self, text: colorLabel.text!)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
