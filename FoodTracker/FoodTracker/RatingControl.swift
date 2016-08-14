//
//  RatingControl.swift
//  FoodTracker
//
//  Created by test on 14/08/2016.
//  Copyright © 2016 test. All rights reserved.
//

import UIKit

class RatingControl: UIView {

    //MARK: Initialisation
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        button.backgroundColor = UIColor.redColor()
        addSubview(button)
    }
    // this matches the placeholder size defined in the stbd
    override func intrinsicContentSize() -> CGSize {
        return CGSize(width: 240, height: 44)
    }

    
}
