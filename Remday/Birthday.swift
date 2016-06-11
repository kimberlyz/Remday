//
//  Birthday.swift
//  Remday
//
//  Created by Kimberly Zai on 6/10/16.
//  Copyright © 2016 Kimberly Zai. All rights reserved.
//

import UIKit

class Birthday {
    
    // MARK: Properties
    var name: String
    var photo: UIImage?
    //var dateAsString: String
    var month: String
    var day: String
    var year: String
    
    // MARK: Initialization
    //init?(name: String, photo: UIImage?, dateAsString: String) {
    init?(name: String, photo: UIImage?, month: String, day: String, year: String) {
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        //self.dateAsString = dateAsString
        self.month = month
        self.day = day
        self.year = year
        
        // Initialization should fail if there is no name
        if (name.isEmpty) {
            return nil
        }
    }
}
