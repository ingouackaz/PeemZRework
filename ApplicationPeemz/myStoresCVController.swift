//
//  myStoresCVController.swift
//  SlidingContainerViewController
//
//  Created by David Ghouzi on 09/07/15.
//  Copyright (c) 2015 Cem Olcay. All rights reserved.
//

import UIKit

class myStoresCVController: UICollectionViewController {
        
        let tutorials = Tutorial.allTutorials()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            collectionView!.contentInset = UIEdgeInsets(top: 100, left: 0, bottom: 50, right: 0)
        
            self.collectionView?.backgroundColor = UIColor.grayColor()
            
            let layout = collectionViewLayout as! UICollectionViewFlowLayout
            layout.itemSize = CGSize(width: CGRectGetWidth(collectionView!.bounds), height: 140)
        }
 
    
    override func viewWillDisappear(animated: Bool) {
        self.collectionView?.backgroundColor = UIColor.whiteColor()
    }
    
    }

    extension myStoresCVController {
        
        override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return tutorials.count
        }
        
        override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("TutorialCell", forIndexPath: indexPath) as! TutorialCell
            cell.tutorial = tutorials[indexPath.item]
            cell.updateParallaxOffset(collectionViewBounds: collectionView.bounds)
            cell.buttonlayer.layer.cornerRadius = 15
            cell.buttonlayer.layer.borderWidth = 2
            cell.buttonlayer.layer.borderColor = UIColor.whiteColor().CGColor
            cell.buttonlayer.layer.backgroundColor = UIColor.grayColor().CGColor
            cell.buttonlayer.layer.opacity = 0.7
            
            cell.cardView.layer.borderColor = UIColor.whiteColor().CGColor
            cell.cardView.layer.borderWidth = 1
            
            return cell
        }
        
    }
    
    extension myStoresCVController {
        
        override func scrollViewDidScroll(scrollView: UIScrollView) {
            let cells = collectionView!.visibleCells() as! [TutorialCell]
            let bounds = collectionView!.bounds
            for cell in cells {
                cell.updateParallaxOffset(collectionViewBounds: bounds)
            }
        }
        
}
