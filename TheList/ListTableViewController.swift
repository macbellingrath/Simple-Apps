//
//  TheListTableViewController.swift
//  TheList
//
//  Created by Mac Bellingrath on 9/28/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit

let API_ROOT = "https://api.github.com"

let username  = "macbellingrath"

let url = API_Root + "/user/" + username




class ListTableViewController: UITableViewController {
    
    let list = List()
    var detailViewController: DetailViewController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
    
        title = "The List"

        self.clearsSelectionOnViewWillAppear = true
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return list.objects.count
    }

 
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
//       
//        let object = list.objects[indexPath.row]
//      
//        let name = object["name"] as? String ?? "No Name"
//         let likes = object["likes"] as? Int ?? 0
//        
//            cell.textLabel?.text = name
//            cell.detailTextLabel?.text = "Likes: " + String(likes)
//        if let name = object["name"] as? String, let likes = object["likes"] as? Int  {

//        }
        
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

    
    // MARK: - Navigation

       override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = list.objects[indexPath.row]
                let controller = segue.destinationViewController as! DetailViewController
               
                controller.detailItem = object["name"] as? String
                
                controller.navigationItem.leftItemsSupplementBackButton = true
      
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
            }


        }
    }
}
