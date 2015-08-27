//
//  ScheduleHeaderView.swift
//  RWDevCon
//
//  Created by Mic Pringle on 06/03/2015.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import UIKit

class ScheduleHeaderView: UICollectionReusableView {
  
  @IBOutlet private weak var backgroundImageView: UIView!
  @IBOutlet private weak var backgroundImageViewHeightLayoutConstraint: NSLayoutConstraint!
  
  @IBOutlet private weak var foregroundImageView: UIView!
  @IBOutlet private weak var foregroundImageViewHeightLayoutConstraint: NSLayoutConstraint!
  
  private var backgroundImageViewHeight: CGFloat = 0
  private var foregroundImageViewHeight: CGFloat = 0
  private var previousHeight: CGFloat = 0

    @IBOutlet weak var nbPointsButton: UIButton!
    @IBOutlet weak var nbStores: UIButton!
    @IBOutlet weak var nbFriends: UIButton!
    //foregroundImageView.layer.cornerRadius = 30
  
  override func awakeFromNib() {
    super.awakeFromNib()
    backgroundImageViewHeight = CGRectGetHeight(backgroundImageView.bounds)
    foregroundImageViewHeight = CGRectGetHeight(foregroundImageView.bounds)
    
    foregroundImageView.clipsToBounds = true
    foregroundImageView.layer.cornerRadius = 70
    foregroundImageView.layer.borderWidth = 1
    foregroundImageView.layer.borderColor = UIColor.whiteColor().CGColor
    
    
    nbPointsButton.clipsToBounds = true
    nbPointsButton.layer.cornerRadius = 10
    nbPointsButton.layer.borderWidth = 1
    nbPointsButton.layer.borderColor = UIColor.whiteColor().CGColor
    nbPointsButton.layer.backgroundColor = UIColor.lightGrayColor().CGColor
    //nbPointsButton.layer.opacity = 0.8
    nbPointsButton.titleLabel?.tintColor = UIColor.whiteColor()
    
    nbStores.clipsToBounds = true
    nbStores.layer.cornerRadius = 10
    nbStores.layer.borderWidth = 1
    nbStores.layer.borderColor = UIColor.whiteColor().CGColor
    nbStores.layer.backgroundColor = UIColor.lightGrayColor().CGColor
    //nbStores.layer.opacity = 0.8
    nbStores.titleLabel?.tintColor = UIColor.whiteColor()
    
    nbFriends.clipsToBounds = true
    nbFriends.layer.cornerRadius = 10
    nbFriends.layer.borderWidth = 1
    nbFriends.layer.borderColor = UIColor.whiteColor().CGColor
    nbFriends.layer.backgroundColor = UIColor.lightGrayColor().CGColor
    //nbFriends.layer.opacity = 0.8
    nbFriends.titleLabel?.tintColor = UIColor.whiteColor()
    
    
    
    var darkBlur = UIBlurEffect(style: UIBlurEffectStyle.Light)
    var blurView = UIVisualEffectView(effect: darkBlur)
    blurView.frame = backgroundImageView.bounds
    backgroundImageView.addSubview(blurView)
  }
  
  override func applyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes!) {
    super.applyLayoutAttributes(layoutAttributes)
    let attributes = layoutAttributes as! DIYLayoutAttributes
    let height = CGRectGetHeight(attributes.frame)
    
    if previousHeight != height {
      backgroundImageViewHeightLayoutConstraint.constant = backgroundImageViewHeight - attributes.deltaY
      foregroundImageViewHeightLayoutConstraint.constant = foregroundImageViewHeight + attributes.deltaY
      previousHeight = height
    }
  }
  
}
