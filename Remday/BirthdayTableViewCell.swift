//
//  BirthdayTableViewCell.swift
//  Remday
//
//  Created by Kimberly Zai on 6/10/16.
//  Copyright © 2016 Kimberly Zai. All rights reserved.
//

import UIKit

class BirthdayTableViewCell: UITableViewCell {
    
    // MARK: Properties
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        photoImageView.layer.cornerRadius = photoImageView.frame.size.width / 2;
        photoImageView.clipsToBounds = true;
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
