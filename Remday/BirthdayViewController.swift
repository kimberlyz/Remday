//
//  BirthdayViewController.swift
//  Remday
//
//  Created by Kimberly Zai on 6/8/16.
//  Copyright © 2016 Kimberly Zai. All rights reserved.
//

import UIKit

class BirthdayViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: Properties
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var photoImageView: UIImageView!
    var monthPickerData: [String] = [String]()
    var dayPickerData: [String] = [String]()
    var yearPickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect data
        picker.delegate = self
        picker.dataSource = self
    
        
        photoImageView.layer.cornerRadius = photoImageView.frame.size.width / 2;
        photoImageView.clipsToBounds = true;
        
        photoImageView.layer.borderWidth = 3.5
        photoImageView.layer.borderColor = UIColor.whiteColor().CGColor
        
        loadPickerData()
    }
    
    func loadPickerData() {
        // Input data into month picker array
        monthPickerData = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
        
        // Input data into day picker array
        for i in 1..<32 {
            dayPickerData += [String(i)]
        }
        
        // Input data into year picker array
        yearPickerData += [""]
        for i in 2016.stride(through: 1900, by: -1) {
            yearPickerData += [String(i)]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    

    // MARK: UIPickerViewDataSource
    // Number of columns of data
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    // Number of rows of data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (component == 0) {
            return monthPickerData.count
        } else if (component == 1) {
            return dayPickerData.count
        } else {
            return yearPickerData.count
        }
    }
    
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        if (component == 0) {
            return (self.view.frame.size.width * 40 ) / 100
        } else if (component == 1) {
            return (self.view.frame.size.width * 20 ) / 100
        } else {
            return (self.view.frame.size.width * 25 ) / 100
        }
        
//        if (component == 0)
//        {
//            return (self.view.frame.size.width * 55 ) / 100  ;
//        }
//        else
//        {
//            return (self.view.frame.size.width * 30 ) / 100  ;
//        }
    }
    
    // MARK: UIPickerViewDelegate
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (component == 0) {
            return monthPickerData[row]
        } else if (component == 1) {
            return dayPickerData[row]
        } else {
            return yearPickerData[row]
        }
    }

}

