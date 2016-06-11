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
    var dateAsString: String
    
    // MARK: Initialization
    init?(name: String, photo: UIImage?, dateAsString: String) {
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.dateAsString = dateAsString
        
        // Initialization should fail if there is no name
        if (name.isEmpty) {
            return nil
        }
    }
}
