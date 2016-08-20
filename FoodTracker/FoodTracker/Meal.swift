//
//  Meal.swift
//  FoodTracker
//
//  Created by test on 16/08/2016.
//  Copyright © 2016 test. All rights reserved.
//  See https://developer.apple.com/library/ios/referencelibrary/GettingStarted/DevelopiOSAppsSwift/Lesson6.html#//apple_ref/doc/uid/TP40015214-CH20-SW1


import UIKit

class Meal {
    // MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    // MARK: Initialization
    //The ? after init indicates that the constructor may fail i.e. optional instance
    init?(name: String, photo: UIImage?, rating: Int) {
        
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
        
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
    
    
}