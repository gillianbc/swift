//
//  Meal.swift
//  FoodTracker
//
//  Created by test on 16/08/2016.
//  Copyright © 2016 test. All rights reserved.
//  See https://developer.apple.com/library/ios/referencelibrary/GettingStarted/DevelopiOSAppsSwift/Lesson6.html#//apple_ref/doc/uid/TP40015214-CH20-SW1


import UIKit

class Meal: NSObject, NSCoding {
    // MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    // MARK: Archiving Paths
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("meals")
    
    //MARK: Types
    struct PropertyKey {
        static let nameKey = "name"
        static let photoKey = "photo"
        static let ratingKey = "rating"
    }
    //MARK: NSCODING
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
        aCoder.encodeObject(photo, forKey: PropertyKey.photoKey)
        aCoder.encodeInteger(rating, forKey: PropertyKey.ratingKey)
    }
    /*
     The required keyword means this initializer must be implemented on every subclass of the class that defines this initializer.
     The convenience keyword denotes this initializer as a convenience initializer. Convenience initializers are secondary, supporting initializers that need to call one of their class’s designated initializers. Designated initializers are the primary initializers for a class. They fully initialize all properties introduced by that class and call a superclass initializer to continue the initialization process up the superclass chain. Here, you’re declaring this initializer as a convenience initializer because it only applies when there’s saved data to be loaded.
     The question mark (?) means that this is a failable initializer that might return nil.
     */
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        
        // Because photo is an optional property of Meal, use conditional cast.
        let photo = aDecoder.decodeObjectForKey(PropertyKey.photoKey) as? UIImage
        
        let rating = aDecoder.decodeIntegerForKey(PropertyKey.ratingKey)
        
        // Must call designated initializer.
        self.init(name: name, photo: photo, rating: rating)
    }
    
    // MARK: Initialization
    //The ? after init indicates that the constructor may fail i.e. optional instance
    init?(name: String, photo: UIImage?, rating: Int) {
        
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
        
        super.init()  //with now have a convenience initializer, so we need to call the superclass init
        
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
    
    
}