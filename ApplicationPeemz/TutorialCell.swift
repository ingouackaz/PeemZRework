//
//  TutorialCell.swift
//  RWDevCon
//
//  Created by Mic Pringle on 02/03/2015.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import UIKit

class TutorialCell: UICollectionViewCell {
  
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var timeAndRoomLabel: UILabel!
  @IBOutlet private weak var speakerLabel: UILabel!
  @IBOutlet private weak var imageView: UIImageView!
  @IBOutlet private weak var imageViewCenterYLayoutConstraint: NSLayoutConstraint!
  
    @IBOutlet weak var buttonlayer: UIButton!
    
    @IBOutlet weak var cardView: UIView!
    
  var parallaxOffset: CGFloat = 0 {
    didSet {
      imageViewCenterYLayoutConstraint.constant = parallaxOffset
    }
  }
  
  var tutorial: Tutorial? {
    didSet {
      if let tutorial = tutorial {
        titleLabel.text = tutorial.title
        speakerLabel.text = tutorial.speaker
        imageView.image = tutorial.backgroundImage
      }
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    clipsToBounds = false
  }

  override func applyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes!) {
    super.applyLayoutAttributes(layoutAttributes)
    imageView.transform = CGAffineTransformMakeRotation(degreesToRadians(14))
  }
  
  func updateParallaxOffset(collectionViewBounds bounds: CGRect) {
    let center = CGPoint(x: CGRectGetMidX(bounds), y: CGRectGetMidY(bounds))
    let offsetFromCenter = CGPoint(x: center.x - self.center.x, y: center.y - self.center.y)
    let maxVerticalOffset = (CGRectGetHeight(bounds) / 2) + (CGRectGetHeight(self.bounds) / 2)
    let scaleFactor = 40 / maxVerticalOffset
    parallaxOffset = -offsetFromCenter.y * scaleFactor
  }
  
    
    @IBAction func FlipCard(sender: UIButton) {
        self.viewFlipFromLeft(cardView, animationTime: 1.0)
        
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
    
}
