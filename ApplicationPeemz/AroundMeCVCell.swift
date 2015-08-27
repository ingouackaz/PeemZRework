//
//  AroundMeCVCell.swift
//  ApplicationPeemz
//
//  Created by David Ghouzi on 25/08/15.
//  Copyright (c) 2015 DGPeemz. All rights reserved.
//

import UIKit

class AroundMeCVCell: UICollectionViewCell {
 
    @IBOutlet weak var storeImage: UIImageView!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var storeLocation: UILabel!
    @IBOutlet weak var storePrice: UILabel!
    
    @IBOutlet weak var backView: UIView!
    
    var inspiration: Inspiration? {
        didSet {
            if let inspiration = inspiration {
                storeImage.image = inspiration.backgroundImage
                storeName.text = inspiration.title
                storeLocation.text = inspiration.roomAndTime
                storePrice.text = inspiration.speaker
            }
        }
    }
    
    override func applyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes!) {
        super.applyLayoutAttributes(layoutAttributes)
        
        let featuredHeight = AroundMeLayoutConstants.Cell.featuredHeight
        let standardHeight = AroundMeLayoutConstants.Cell.standardHeight
        
        let delta = 1 - ((featuredHeight - CGRectGetHeight(frame)) / (featuredHeight - standardHeight))
        
        let minAlpha: CGFloat = 0.1
        let maxAlpha: CGFloat = 0.8
        
        backView.alpha = maxAlpha - (delta * (maxAlpha - minAlpha))
        //imageCoverView.alpha = 0.5
        
        let scale = max(delta, 0.5)
        storeName.transform = CGAffineTransformMakeScale(scale, scale)
        
        storeLocation.alpha = delta
        storePrice.alpha = delta
        
        
        storeLocation.textColor = UIColor.greenColor()
        
        storeName.layer.backgroundColor = UIColor.blackColor().CGColor
        storeName.layer.opacity = 0.6
        
        storePrice.layer.backgroundColor = UIColor.blackColor().CGColor
        storePrice.layer.opacity = Float(delta*0.6)
        
        storeLocation.layer.backgroundColor = UIColor.blackColor().CGColor
        storeLocation.layer.opacity = Float(delta*0.6)
        
        
    }
    
}