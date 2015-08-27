//
//  StoreTestTVC.swift
//  SlidingContainerViewController
//
//  Created by David Ghouzi on 23/07/15.
//  Copyright (c) 2015 Cem Olcay. All rights reserved.
//

import UIKit


class StoreTestTVC: UITableViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    var centerView: UILabel!
    var storeName: UILabel!
    var storeLocation: UILabel!
    var topBackView: UIView!
    var searchField: UILabel!
    
    var headerStoreName : UILabel!
    var headerStoreLocation : UILabel!
    
    let kScreenWidth = CGRectGetWidth(UIScreen.mainScreen().bounds)
    let kScreenHeight = CGRectGetHeight(UIScreen.mainScreen().bounds)
    
    let inspirations = top50.allInspirations()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "navi_back_image.png"), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage.alloc()
        self.setNavigationItem()
        
        var headerView = UIView(frame: CGRectMake(0, 0, kScreenWidth, 300))
        headerView.tag = 10086
        headerView.backgroundColor = UIColor.whiteColor()
    
        var headerImageView = UIImageView(frame: CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 300))
        headerImageView.image = UIImage(named: "Inspiration-04")
        headerView.addSubview(headerImageView)
        
        storeName = UILabel(frame: CGRectMake(5, 246, kScreenWidth - 10, 25))
        storeName.text = "L'Eclaireur"
        storeName.textColor = UIColor.orangeColor()
        storeName.textAlignment = NSTextAlignment.Center
        storeName.font = UIFont.systemFontOfSize(20)
        //storeName.layer.borderWidth = 1
        storeName.layer.backgroundColor = UIColor.clearColor().CGColor
        storeName.layer.opacity = 0.8
        headerView.addSubview(storeName)
        

        storeLocation = UILabel(frame: CGRectMake(5, 271, kScreenWidth - 10, 16))
        storeLocation.text = "164 rue du Faubourg Saint-Honoré, Paris"
        storeLocation.textColor = UIColor.orangeColor()
        storeLocation.textAlignment = NSTextAlignment.Center
        storeLocation.font = UIFont.systemFontOfSize(12)
        //storeLocation.layer.borderWidth = 1
        storeLocation.layer.backgroundColor = UIColor.clearColor().CGColor
        storeLocation.layer.opacity = 0.8
        headerView.addSubview(storeLocation)
        
        self.tableView.tableHeaderView = headerView
        //self.tableView.frame = CGRect(x: 0, y: -64, width: self.view.frame.width, height: self.view.frame.height)
        self.tableView.contentInset = UIEdgeInsetsMake(-64,0,0,0)
    }
    
//    override func viewWillAppear(animated: Bool) {
//        super.viewWillAppear(true);
//        //navigationController?.navigationBar.hidden = true // for navigation bar hide
//        UIApplication.sharedApplication().statusBarHidden=true; // for status bar hide
//    }
    
    
    func setNavigationItem() {
        

        var rr = UIBarButtonItem(image: UIImage(named: "Back"), style: UIBarButtonItemStyle.Plain, target: self, action: "backButtonAction:")
        
        self.navigationItem.leftBarButtonItem = rr
        
        var rightItem = UIBarButtonItem(barButtonSystemItem: .Search, target: self, action: "showMenu")
        rightItem.tintColor = UIColor.orangeColor()
        self.navigationItem.rightBarButtonItem = rightItem
        
        topBackView = UIView(frame: CGRectMake(0, -20, kScreenWidth, 64))
        topBackView.backgroundColor = UIColor(red: 0.7, green: 0.8, blue: 1, alpha: 0)
        
        
        topBackView.clipsToBounds = true
        self.navigationController?.navigationBar .insertSubview(topBackView, atIndex: 0)
        
        searchField = UILabel(frame: CGRectMake(55, 65, kScreenWidth - 110, 16))
        searchField.text = "164 rue du Faubourg Saint-Honoré, Paris"
        searchField.textColor = UIColor.whiteColor()
        topBackView.addSubview(searchField)
        
        centerView = UILabel(frame: CGRectMake(kScreenWidth/2 - 60, 0, 120, 41))
        //centerView.textAlignment = .Center
        //centerView.textColor = UIColor.whiteColor()
        //centerView.text = "L'Eclaireur"
        //centerView.font = UIFont.boldSystemFontOfSize(14)
        //centerView.textColor = UIColor(white: 1, alpha: 0)
        
        
        headerStoreName = UILabel(frame: CGRectMake(0, 0, 120, 25))
        headerStoreName.textAlignment = .Center
        headerStoreName.textColor = UIColor.whiteColor()
        headerStoreName.text = "L'Eclaireur"
        headerStoreName.font = UIFont.boldSystemFontOfSize(14)
        headerStoreName.textColor = UIColor(white: 1, alpha: 0)

        headerStoreLocation = UILabel(frame: CGRectMake(0, 26, 120, 16))
        headerStoreLocation.textAlignment = .Center
        headerStoreLocation.textColor = UIColor.whiteColor()
        headerStoreLocation.text = "164 rue du Faubourg"
        headerStoreLocation.font = UIFont.boldSystemFontOfSize(12)
        headerStoreLocation.textColor = UIColor(white: 1, alpha: 0)
        
        centerView.addSubview(headerStoreName)
        centerView.addSubview(headerStoreLocation)
        
        self.navigationController?.navigationBar.insertSubview(centerView,  aboveSubview: topBackView)
        
    }
    
    func backButtonAction(sender:UIBarButtonItem!)
    {
        println("Button tapped")
        
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 4
        
    }

//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell
//
//        // Configure the cell...
//
//        return cell
//    }
    
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

    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        var tag = collectionView.tag
        
        var pageImages = [String]()
        
        pageImages = ["Atelson","Chaussures","Chemise","Chemise2","Cravattes","TenueBeige","TenueDimanche","Polo","Veste2","Atelson","Chaussures","Chemise","Chemise2","Cravattes","TenueBeige","TenueDimanche"]
        
        
        if tag == 0 {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! storeShowCaseCVC
            cell.productPicture.image = UIImage(named: pageImages[indexPath.row])
            //cell.inspiration = inspirations[indexPath.row-1]
            //cell.imageRecommandCell?.setImage(UIImage(named: Albums[indexPath.row]), forState: UIControlState.Normal)
            //cell.imageRecommandCell?.imageView?.contentMode = .ScaleAspectFill
            //cell.imageRecommandCell?.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell2", forIndexPath: indexPath) as!storeCommentCVC
            return cell
        }
        
    }
    
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var tag = collectionView.tag
        
        if tag == 0 {
            return 16
        } else {
            return 4
        }
        
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        var tag = collectionView.tag
        
        if tag == 0 {
            var widthscreen = self.view.frame.width
            return CGSize(width: 115, height: 135)
        } else {
            var det = collectionView.frame.width
            return CGSize(width: det, height: 189)
        }
    }
    
    
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        
        var currentPosition: CGFloat = tableView.contentOffset.y
        
        if currentPosition >= 0  && currentPosition < 187.5 {
            //centerView.textColor = UIColor(white: 1, alpha: 0)
            headerStoreLocation.textColor = UIColor(white: 1, alpha:0)
            headerStoreName.textColor = UIColor(white: 1, alpha:0)
            println(currentPosition)
            var percent = currentPosition / 187.5
            //searchField.layer.borderColor = UIColor(white: 1, alpha: percent*0.85).CGColor
            //searchField.textColor = UIColor(white: 1, alpha: percent)
            topBackView.backgroundColor = UIColor(red: 28 / 255, green: 141 / 255, blue: 218 / 255, alpha: percent)
        } else if currentPosition >= 187.5 && currentPosition < 228.5 {
            headerStoreName.textColor = UIColor(white: 1, alpha: (currentPosition - 187.5) / (228.5 - 187.5))
            //centerView.layer.position.y = centerView.layer.position.y -
        } else if currentPosition >= 228.5 && currentPosition < 240 {
            headerStoreLocation.textColor = UIColor(white: 1, alpha: (currentPosition - 228.5) / (240 - 228.5))
            //centerView.layer.position.y = centerView.layer.position.y -
        }

        

    }
}




