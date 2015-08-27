//
//  AroundMeCVController.swift
//  ApplicationPeemz
//
//  Created by David Ghouzi on 25/08/15.
//  Copyright (c) 2015 DGPeemz. All rights reserved.
//

import UIKit

class AroundMeCVController: UICollectionViewController {

    let inspirations = Inspiration.allInspirations()
    
    var settings: SettingsView!
    //  override func preferredStatusBarStyle() -> UIStatusBarStyle {
    //    return UIStatusBarStyle.LightContent
    //  }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.navigationController?.navigationBar.barStyle = UIBarStyle.BlackTranslucent
        //  self.navigationController?.navigationBarHidden = false
        // self.navigationController?.navigationBar.translucent = false
        if let patternImage = UIImage(named: "Pattern") {
            view.backgroundColor = UIColor(patternImage: patternImage)
        }
        collectionView!.backgroundColor = UIColor.clearColor()
        collectionView!.decelerationRate = UIScrollViewDecelerationRateFast
        
        settings = NSBundle.mainBundle().loadNibNamed("Settings", owner: self, options: nil).last as! SettingsView
        settings.frame = CGRectMake(0, -self.view.frame.size.height + 150, self.view.frame.size.width, self.view.frame.size.height)
        self.view.addSubview(settings)
        
    }
    
    
}

extension AroundMeCVController {
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
        
        
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return inspirations.count
        
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("aroundCVCell", forIndexPath: indexPath) as! AroundMeCVCell
        cell.inspiration = inspirations[indexPath.item]
        return cell
        
    }
    
    
    
}
