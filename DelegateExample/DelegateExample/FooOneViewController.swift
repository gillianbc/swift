//
//  FooOneViewController.swift
//  DelegateExample
//
//  Created by test on 21/08/2016.
//  Copyright © 2016 test. All rights reserved.
//

import UIKit

class FooOneViewController: UIViewController,FooTwoViewControllerDelegate {

    @IBOutlet weak var colorLable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: DELEGATE
    func myVCDidFinish(controller: FooTwoViewController, text: String) {
        colorLable.text = "The Color is " +  text
        controller.navigationController?.popViewControllerAnimated(true)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "mySegue"{
            let vc = segue.destinationViewController as! FooTwoViewController
            //set the label field on VC2 to be the text of the label field on VC1 (this VC)
            vc.colorString = colorLable.text!
            vc.delegate = self
        }
    }
}
