//
//  HomeTVController.swift
//  SlidingContainerViewController
//
//  Created by David Ghouzi on 16/07/15.
//  Copyright (c) 2015 Cem Olcay. All rights reserved.
//

import UIKit

class HomeTVController: UITableViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
       tableView.contentInset.top = 45
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 5
        
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
           return 200
        } else if indexPath.row == 1 {
            return 240
        } else if indexPath.row == 2 {
          return 410
        } else if indexPath.row == 3 {
            return 300
        } else {
            return 200
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("cellResearch", forIndexPath: indexPath) as! UITableViewCell
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCellWithIdentifier("homeMenu", forIndexPath: indexPath) as! UITableViewCell
                return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCellWithIdentifier("category", forIndexPath: indexPath) as! UITableViewCell
                return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCellWithIdentifier("lookbook", forIndexPath: indexPath) as! UITableViewCell
                return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("lottery", forIndexPath: indexPath) as! UITableViewCell
                return cell
        }
        
//    if indexPath.row == 0 {
//        let cell = tableView.dequeueReusableCellWithIdentifier("cellResearch", forIndexPath: indexPath) as! UITableViewCell
//        return cell
//    } else if indexPath.row == 1 {
//    let cell = tableView.dequeueReusableCellWithIdentifier("homeMenu", forIndexPath: indexPath) as! homeMenuTVCell
//    return cell
//    } else if indexPath.row == 2 {
//    let cell = tableView.dequeueReusableCellWithIdentifier("category", forIndexPath: indexPath) as! UITableViewCell
//    return cell
//    } else if indexPath.row == 3 {
//    let cell = tableView.dequeueReusableCellWithIdentifier("lookbook", forIndexPath: indexPath) as! UITableViewCell
//    return cell
//    } else {
//    let cell = tableView.dequeueReusableCellWithIdentifier("lottery", forIndexPath: indexPath) as! UITableViewCell
//    return cell
//    }
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        //var tag = collectionView.tag
        
        var pageImages = [String]()
        
        pageImages = ["Atelson","Chaussures","Chemise2","Cravattes"]
        
        
        //if tag == 0 {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! categoryCVC
        cell.imageCategory.image = UIImage(named: pageImages[indexPath.row])
        cell.categoryname.text = pageImages[indexPath.row]
        return cell
        //} else {
        //   let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell2", forIndexPath: indexPath) as!storeCommentCVC
        //  return cell
        //}
        
    }
    
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        //var tag = collectionView.tag
        
        //if tag == 0 {
        //    return 16
        //} else {
        return 4
        //}
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
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
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    
    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        
//        var tag = collectionView.tag
//        
//        if tag == 0 {
//            var widthscreen = self.view.frame.width
//            return CGSize(width: 115, height: 135)
//        } else {
//            var det = collectionView.frame.width
//            return CGSize(width: det, height: 189)
//        }
//    }

}
