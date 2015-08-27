//
//  TableViewController.swift
//  SlidingContainerViewController
//
//  Created by David Ghouzi on 08/07/15.
//  Copyright (c) 2015 Cem Olcay. All rights reserved.
//

import UIKit

class Top50TVController: UITableViewController {

      let inspirations = top50.allInspirations()
        var page2show = Int()
    
    @IBAction func customSegmented(sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 1:
            self.view.backgroundColor = UIColor.greenColor()
            page2show = 1
            //self.view.viewFlipFromLeft(self., animationTime: 1.0)
            self.viewFlipFromLeft(self.tableView, animationTime: 1.2)
            self.tableView.reloadData()
            println("Store")
        default:
            self.view.backgroundColor = UIColor.purpleColor()
            page2show = 0
            self.viewFlipFromRight(self.tableView, animationTime: 1.2)
            println("Article")
            self.tableView.reloadData()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset.top = 35
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if page2show == 0 {
            return inspirations.count + 2
        } else {
            return 6
        }
        
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    if page2show == 0 {
        if indexPath.row == 1 {
            return 180
        }else if indexPath.row > 1 {
            return 180
        }else {
            return 50
        }
    } else {
        if indexPath.row > 0 {
            return 200
        } else {
            return 50 //80
        }
    }
    
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        if page2show == 0 {
            
            if indexPath.row > 0 {
                let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! top50TVCell
                cell.inspiration = inspirations[indexPath.row-1]
                return cell
                
            } else {
                let cell = tableView.dequeueReusableCellWithIdentifier("initialCell", forIndexPath: indexPath) as! UITableViewCell
                return cell
            }
            
        } else {
            
            if indexPath.row > 0 {
                let cell = tableView.dequeueReusableCellWithIdentifier("tets", forIndexPath: indexPath) as! TopArticlesTableViewCell
                cell.image1.setBackgroundImage(inspirations[2*indexPath.row-2].backgroundImage2, forState: UIControlState.Normal)
                cell.image2.setBackgroundImage(inspirations[2*indexPath.row-1].backgroundImage2, forState: UIControlState.Normal)
                return cell
            } else {
                let cell = tableView.dequeueReusableCellWithIdentifier("initialCell", forIndexPath: indexPath) as! UITableViewCell
                return cell
            }
        }
        
        
    
    }
        
    
    
    
    
    
    func viewFlipFromLeft(view:UIView,animationTime:Float)
    {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationCurve(UIViewAnimationCurve.EaseInOut)
        UIView.setAnimationDuration(NSTimeInterval(animationTime))
        UIView.setAnimationTransition(UIViewAnimationTransition.FlipFromLeft, forView: view, cache: false)
        UIView.commitAnimations()
        
        // Add animation to load back card image while we're in the middle of the animation time
        
    }

    func viewFlipFromRight(view:UIView,animationTime:Float)
    {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationCurve(UIViewAnimationCurve.EaseInOut)
        UIView.setAnimationDuration(NSTimeInterval(animationTime))
        UIView.setAnimationTransition(UIViewAnimationTransition.FlipFromRight, forView: view, cache: false)
        UIView.commitAnimations()
        
        // Add animation to load back card image while we're in the middle of the animation time
        
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

}
