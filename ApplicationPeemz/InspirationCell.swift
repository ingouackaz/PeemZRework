//
//  TutorialCell.swift
//  RWDevCon
//
//  Created by Mic Pringle on 27/02/2015.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import UIKit

class InspirationCell: UICollectionViewCell {
  
  @IBOutlet private weak var imageView: UIImageView!
  @IBOutlet private weak var imageCoverView: UIView!
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var timeAndRoomLabel: UILabel!
  @IBOutlet private weak var speakerLabel: UILabel!
  
    @IBOutlet weak var statView: StatView!
    
    
  var inspiration: Inspiration? {
    didSet {
      if let inspiration = inspiration {
        imageView.image = inspiration.backgroundImage
        titleLabel.text = inspiration.title
        timeAndRoomLabel.text = inspiration.roomAndTime
        speakerLabel.text = inspiration.speaker
        statView.range = 10
        statView.curValue = CGFloat(8.9)
      }
    }
  }
  
  override func applyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes!) {
    super.applyLayoutAttributes(layoutAttributes)
    
    let featuredHeight = UltravisualLayoutConstants.Cell.featuredHeight
    let standardHeight = UltravisualLayoutConstants.Cell.standardHeight
        
    let delta = 1 - ((featuredHeight - CGRectGetHeight(frame)) / (featuredHeight - standardHeight))
    
    let minAlpha: CGFloat = 0.1
    let maxAlpha: CGFloat = 0.8
    
    imageCoverView.alpha = maxAlpha - (delta * (maxAlpha - minAlpha))
    //imageCoverView.alpha = 0.5
    
    let scale = max(delta, 0.5)
    titleLabel.transform = CGAffineTransformMakeScale(scale, scale)
    
    timeAndRoomLabel.alpha = delta
    speakerLabel.alpha = delta
    
    
    timeAndRoomLabel.textColor = UIColor.greenColor()
    
    titleLabel.layer.backgroundColor = UIColor.blackColor().CGColor
    titleLabel.layer.opacity = 0.6

    speakerLabel.layer.backgroundColor = UIColor.blackColor().CGColor
    speakerLabel.layer.opacity = Float(delta*0.6)
    
    timeAndRoomLabel.layer.backgroundColor = UIColor.blackColor().CGColor
    timeAndRoomLabel.layer.opacity = Float(delta*0.6)
    

  }
  
}
