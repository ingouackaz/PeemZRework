//
//  aroundMeTVController.swift
//  SlidingContainerViewController
//
//  Created by David Ghouzi on 16/07/15.
//  Copyright (c) 2015 Cem Olcay. All rights reserved.
//

import UIKit

class aroundMeTVController: UITableViewController {

    let inspirations = top50.allInspirations()
    var page2show = Int()
    
    @IBAction func customSeg(sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 1:
            self.view.backgroundColor = UIColor.purpleColor()
            page2show = 1
            self.animationScaleEffect(self.tableView, animationTime: 1.0)
            self.tableView.reloadData()
            println("mapView")
            
        case 2:
            self.view.backgroundColor = UIColor.greenColor()
            page2show = 2
            self.viewFlipFromLeft(self.tableView, animationTime: 1.2)
            self.tableView.reloadData()
            println("articles")
            
        default:
            self.view.backgroundColor = UIColor.greenColor()
            page2show = 0
            //self.view.viewFlipFromLeft(self., animationTime: 1.0)
            self.viewFlipFromRight(self.tableView, animationTime: 1.2)
            self.tableView.reloadData()
            println("stores")
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset.top = 35
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
        if page2show == 0 {
            return inspirations.count + 1
            
        } else if page2show == 2{
            return 6
            
        } else {
            return 2
        }
    }


    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if page2show == 0 {
            
            
            if indexPath.row > 0 {
                return 180
            }else {
                return 50
            }
            
            
        } else if page2show == 2 {
            
            
            if indexPath.row > 0 {
                return 180
            } else {
                return 50 //80
            }
        
            
            
        } else {
            
            
            if indexPath.row > 0 {
                return 600
            } else {
                return 50 //80
            }
            
            
        }
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        if page2show == 0 {
            
            
            if indexPath.row > 0 {
                let cell = tableView.dequeueReusableCellWithIdentifier("listView", forIndexPath: indexPath) as! aroundMeStoresTVCell
                cell.inspiration = inspirations[indexPath.row-1]
                return cell
                
            } else {
                let cell = tableView.dequeueReusableCellWithIdentifier("initialCell", forIndexPath: indexPath) as! UITableViewCell
                return cell
            }
            
            
            
        } else if page2show == 2 {
            
            
            
            
            if indexPath.row > 0 {
                let cell = tableView.dequeueReusableCellWithIdentifier("articleView", forIndexPath: indexPath) as! aroundMeArticlesTVCell
                cell.image1.setBackgroundImage(inspirations[2*indexPath.row-2].backgroundImage2, forState: UIControlState.Normal)
                cell.image2.setBackgroundImage(inspirations[2*indexPath.row-1].backgroundImage2, forState: UIControlState.Normal)
                return cell
            } else {
                let cell = tableView.dequeueReusableCellWithIdentifier("initialCell", forIndexPath: indexPath) as! UITableViewCell
                return cell
            }
            
            
            
            
        } else {
            
            
            
            if indexPath.row > 0 {
                let cell = tableView.dequeueReusableCellWithIdentifier("mapView", forIndexPath: indexPath) as! aroundMeMapTableViewCell
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
    
    func animationScaleEffect(view:UIView,animationTime:Float)
    {
        UIView.animateWithDuration(NSTimeInterval(animationTime), animations: {
            
            view.transform = CGAffineTransformMakeScale(0.001, 0.001)
            
            },completion:{completion in
                UIView.animateWithDuration(NSTimeInterval(animationTime), animations: { () -> Void in
                    
                    view.transform = CGAffineTransformMakeScale(1, 1)
                })
        })
        
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
