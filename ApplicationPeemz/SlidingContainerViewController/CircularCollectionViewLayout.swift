//
//  CircularCollectionViewLayout.swift
//  CircularCollectionView
//
//  Created by David Ghouzi on 24/08/15.
//  Copyright (c) 2015 Rounak Jain. All rights reserved.
//

import UIKit

class CircularCollectionViewLayoutAttributes: UICollectionViewLayoutAttributes {
  // 1
  var anchorPoint = CGPoint(x: 0.5, y: 0.5)
  var angle: CGFloat = 0 {
    // 2
    didSet {
      zIndex = Int(angle * 1000000)
      transform = CGAffineTransformMakeRotation(angle)
    }
  }
  // 3
  override func copyWithZone(zone: NSZone) -> AnyObject {
    let copiedAttributes: CircularCollectionViewLayoutAttributes =
    super.copyWithZone(zone) as! CircularCollectionViewLayoutAttributes
    copiedAttributes.anchorPoint = self.anchorPoint
    copiedAttributes.angle = self.angle
    return copiedAttributes
  }
}



class CircularCollectionViewLayout: UICollectionViewLayout {
  
  override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
    return true
  }
  
  let itemSize = CGSize(width: 280, height: 480)
  // 133 173
  var angleAtExtreme: CGFloat {
    return collectionView!.numberOfItemsInSection(0) > 0 ?
      -CGFloat(collectionView!.numberOfItemsInSection(0) - 1) * anglePerItem : 0
  }
  var angle: CGFloat {
    return angleAtExtreme * collectionView!.contentOffset.x / (collectionViewContentSize().width -
      CGRectGetWidth(collectionView!.bounds))
  }
  
  
  
  var radius: CGFloat = 500 {
    didSet {
      invalidateLayout()
    }
  }
  
  var anglePerItem: CGFloat {
    return atan(itemSize.width / radius)
  }
  
  override func collectionViewContentSize() -> CGSize {
    return CGSize(width: CGFloat(collectionView!.numberOfItemsInSection(0)) * itemSize.width,
      height: CGRectGetHeight(collectionView!.bounds))
  }
  
  
  override class func layoutAttributesClass() -> AnyClass {
    return CircularCollectionViewLayoutAttributes.self
  }
  
  var attributesList = [CircularCollectionViewLayoutAttributes]()
 
  
  override func prepareLayout() {
    super.prepareLayout()
    
    let centerX = collectionView!.contentOffset.x + (CGRectGetWidth(collectionView!.bounds) / 2.0)
    let anchorPointY = ((itemSize.height / 2.0) + radius) / itemSize.height
    //println(collectionView!.contentOffset.x)
    // 1
    let theta = atan2(CGRectGetWidth(collectionView!.bounds) / 2.0,
      radius + (itemSize.height / 2.0) - (CGRectGetHeight(collectionView!.bounds) / 2.0))
    // 2
    var startIndex = 0
    var endIndex = collectionView!.numberOfItemsInSection(0) - 1
    // 3
    if (angle < -theta) {
      startIndex = Int(floor((-theta - angle) / anglePerItem))
    }
    // 4
    endIndex = min(endIndex, Int(ceil((theta - angle) / anglePerItem)))
    // 5
    if (endIndex < startIndex) {
      endIndex = 0
      startIndex = 0
    }
    
    
    attributesList = (startIndex...endIndex).map { (i)
      -> CircularCollectionViewLayoutAttributes in
      // 1
      let attributes = CircularCollectionViewLayoutAttributes(forCellWithIndexPath: NSIndexPath(forItem: i,
        inSection: 0))
        
        
      //attributes.size = self.itemSize

      // 2
    
      attributes.center = CGPoint(x: centerX, y: CGRectGetMidY(self.collectionView!.bounds))
      // 3
      //attributes.angle = self.anglePerItem*CGFloat(i)
      attributes.angle = self.angle + (self.anglePerItem * CGFloat(i))
      //println(attributes.angle)
        
               attributes.size = CGSize(width: (280 * (1 - abs(2 * attributes.angle))), height: (480 * (1 - abs(2 * attributes.angle))))
      attributes.alpha = 1 - abs(3 * attributes.angle)
        
      
      attributes.anchorPoint = CGPoint(x: 0.5, y: anchorPointY)
      return attributes
    }
  }
  
  override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]? {
    return attributesList
  }
  
  override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath)
    -> UICollectionViewLayoutAttributes! {
      return attributesList[indexPath.row]
  }
  
}
