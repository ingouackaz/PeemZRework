//
//  CollectionViewController.swift
//  CircularCollectionView
//
//  Created by Rounak Jain on 10/05/15.
//  Copyright (c) 2015 Rounak Jain. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {
  
  //let images: [String] = NSBundle.mainBundle().pathsForResourcesOfType("png", inDirectory: "Exemples") as! [String]
  
    
    let images = ["Look1","Look2","Look3","Look4","Look5","Look6","Look7","Look8","Look9","Look10","Look11","Look12","Look13"]
    
  override func viewDidLoad() {
    super.viewDidLoad()
    // Register cell classes
    collectionView!.registerNib(UINib(nibName: "CircularCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CellCircle")
    let imageView = UIImageView(image: UIImage(named: "whiteTheme"))
    imageView.contentMode = UIViewContentMode.ScaleAspectFill
    collectionView!.backgroundView = imageView
  }
  
}

extension CollectionViewController: UICollectionViewDataSource {
  
  // MARK: UICollectionViewDataSource
  
  override func collectionView(collectionView: UICollectionView,
    numberOfItemsInSection section: Int) -> Int {
      return images.count
  }
  
  override func collectionView(collectionView: UICollectionView,
    cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
      let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CellCircle", forIndexPath: indexPath) as! CircularCollectionViewCell
      cell.imageName = images[indexPath.row]
    
        
      return cell
  }
  
}
