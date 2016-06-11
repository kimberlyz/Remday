//
//  BirthdayTableViewController.swift
//  Remday
//
//  Created by Kimberly Zai on 6/10/16.
//  Copyright © 2016 Kimberly Zai. All rights reserved.
//

import UIKit

class BirthdayTableViewController: UITableViewController {

    // MARK: Properties
    var birthdays = [Birthday]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadSampleBirthdays()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
    
    func loadSampleBirthdays() {
        let photo1 = UIImage(named: "meal1")
        let birthday1 = Birthday(name: "Marshmallow", photo: photo1, dateAsString: "June 8, 2010")!
        
        let photo2 = UIImage(named: "meal2")
        let birthday2 = Birthday(name: "Graham", photo: photo2, dateAsString: "April 2, 1959")!
        
        let photo3 = UIImage(named: "meal3")
        let birthday3 = Birthday(name: "Cracker", photo: photo3, dateAsString: "September 28, 2000")!
        
        birthdays += [birthday1, birthday2, birthday3]
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return birthdays.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "BirthdayTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! BirthdayTableViewCell
        
        // Fetches the appropriate birthday for the data source layout.
        let birthday = birthdays[indexPath.row]
        
        cell.nameLabel.text = birthday.name
        cell.photoImageView.image = birthday.photo
        cell.dateLabel.text = birthday.dateAsString

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
