//
//  BirthdayViewController.swift
//  Remday
//
//  Created by Kimberly Zai on 6/8/16.
//  Copyright © 2016 Kimberly Zai. All rights reserved.
//

import UIKit

class BirthdayViewController: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var monthPickerData: [String] = [String]()
    var dayPickerData: [String] = [String]()
    var yearPickerData: [String] = [String]()
    
    var pickedMonth: String = "January"
    var pickedDay: String = "1"
    var pickedYear: String = ""
    
    var imagePickerController: UIImagePickerController?
    var monthDict: [String: Int] = ["January": 1, "February": 2, "March": 3, "April": 4, "May": 5, "June": 6, "July": 7, "August": 8, "September": 9, "October": 10, "November": 11, "December": 12]
    
    /*
     This value is either passed by `BirthdayTableViewController` in `prepareForSegue(_:sender:)`
     or constructed as part of adding a new birthday
     */
    var birthday: Birthday?
    
    enum Month: Int {
        case January = 1
        case February, March, April, May, June, July, August, September, October, November, December
        func simpleDescription() -> String {
            return String(self.rawValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.
        nameTextField.delegate = self
        
        // Connect data
        picker.delegate = self
        picker.dataSource = self
        
        loadPickerData()
        checkAndLoadExistingMeal()

        

        // Enable the Save button only if the text field has a valid Meal name.
        checkValidBirthdayName()
    
        makeImageBorderedAndCircular()

        

    }
    
    func checkAndLoadExistingMeal() {
        // Set up views if editing an existing Meal.
        if let birthday = birthday {
            navigationItem.title = birthday.name
            nameTextField.text = birthday.name
            photoImageView.image = birthday.photo
            pickedMonth = birthday.month
            pickedDay = birthday.day
            pickedYear = birthday.year
            
            picker.selectRow(monthDict[pickedMonth]! - 1, inComponent: 0, animated: false)
            picker.selectRow(Int(pickedDay)! - 1, inComponent: 1, animated: false)
            
            if (pickedYear.isEmpty) {
                picker.selectRow(0, inComponent: 2, animated: false)
            } else {
                picker.selectRow(2016 - Int(pickedYear)! + 1, inComponent: 2, animated: false)
            }
        }
    }
    func makeImageBorderedAndCircular() {
        // Display image as a circle
        photoImageView.layer.cornerRadius = photoImageView.frame.size.width / 2;
        photoImageView.clipsToBounds = true;
        
        // Create white border around image
        photoImageView.layer.borderWidth = 3.5
        photoImageView.layer.borderColor = UIColor.whiteColor().CGColor
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
    
    // MARK: Navigation
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // This method lets you configure a view controller before it's presented.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (saveButton === sender) {
            let name = nameTextField.text ?? ""
            let photo = photoImageView.image
            //let date = pickedMonth
            
            // Set the birthday to be passed to BirthdayTableViewController after the unwind segue.
            birthday = Birthday(name: name, photo: photo, month: pickedMonth, day: pickedDay, year: pickedYear)
        }
    }
    
    // MARK: Actions
    @IBAction func selectImage(sender: UITapGestureRecognizer) {
    
        // Hide the keyboard.
        nameTextField.resignFirstResponder()
        showPhotoSourceSelection()
    }


}

extension BirthdayViewController: UIPickerViewDelegate, UIPickerViewDataSource {
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
    
    // Width of each column of data
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        if (component == 0) {
            return self.view.frame.size.width * 0.4
        } else if (component == 1) {
            return self.view.frame.size.width * 0.2
        } else {
            return self.view.frame.size.width * 0.25
        }
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
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if (component == 0) {
            pickedMonth = monthPickerData[row]
        } else if (component == 1) {
            pickedDay = dayPickerData[row]
        } else {
            pickedYear = yearPickerData[row]
        }
    }
}

extension BirthdayViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        // The info dictionary contains multiple representations of the image, and this uses the original.
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Set photoImageView to display the selected image.
        photoImageView.image = selectedImage
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func showPhotoSourceSelection() {
        // Only show choice to choose between photo library and camera if rear camera is available
        if (UIImagePickerController.isCameraDeviceAvailable(.Rear)) {
            // Allow user to choose between photo library and camera
            let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            alertController.addAction(cancelAction)
            
            let cameraAction = UIAlertAction(title: "Take Photo", style: .Default) { (action) in
                self.showImagePickerController(.Camera)
            }
            alertController.addAction(cameraAction)
            
            let photoLibraryAction = UIAlertAction(title: "Get Photo From Library", style: .Default) { (action) in
                self.showImagePickerController(.PhotoLibrary)
            }
            
            alertController.addAction(photoLibraryAction)
            presentViewController(alertController, animated: true, completion: nil)
        } else {
            showImagePickerController(.PhotoLibrary)
        }
    }
    
    func showImagePickerController(sourceType: UIImagePickerControllerSourceType) {
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        imagePickerController = UIImagePickerController()
        
        // Can either allow user to take photos or select photos from photo library
        imagePickerController!.sourceType = sourceType
        
        // Make sure BirthdayViewController is notified when the user picks an image.
        imagePickerController!.delegate = self
        
        presentViewController(imagePickerController!, animated: true, completion: nil)
    }
}

extension BirthdayViewController: UITextFieldDelegate {
    // MARK: UITextFieldDelegate
    
    func textFieldDidBeginEditing(textField: UITextField) {
        // Disable the Save button while editing.
        saveButton.enabled = false
    }

    func textFieldDidEndEditing(textField: UITextField) {
        checkValidBirthdayName()
        navigationItem.title = textField.text
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func checkValidBirthdayName() {
        // Disable the Save button if the text field is empty.
        let text = nameTextField.text ?? ""
        saveButton.enabled = !text.isEmpty
    }
    

}

