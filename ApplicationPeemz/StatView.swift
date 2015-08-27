//
//  StatView.swift
//  MyStats3
//
//  Created by Main Account on 5/11/15.
//  Copyright (c) 2015 Razeware LLC. All rights reserved.
//


// This View will help to design the rating of one Store

import UIKit

@IBDesignable
class StatView: UIView {

  let bgLayer = CAShapeLayer()
  let fgLayer = CAShapeLayer()
  let percentLabel = UILabel()
  let captionLabel = UILabel()
  
  @IBInspectable var bgColor: UIColor = UIColor.grayColor() {
    didSet {
      configure()
    }
  }
  
  @IBInspectable var fgColor: UIColor = UIColor.blackColor() {
    didSet {
      configure()
    }
  }
  
  var range = CGFloat(10)
  var curValue = CGFloat(8.5) {
    didSet {
      animate()
    }
  }
  let margin = CGFloat(5)
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setup()
    configure()
  }
  
  override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    setup()
    configure()
  }
  
  func setup() {
  
    // Setup bg
    bgLayer.lineWidth = CGFloat(5.0)
    bgLayer.fillColor = UIColor.clearColor().CGColor
    bgLayer.strokeEnd = 1
    layer.addSublayer(bgLayer)
    
    // Setup fg
    fgLayer.lineWidth = CGFloat(5.0)
    fgLayer.fillColor = UIColor.clearColor().CGColor
    fgLayer.strokeEnd = 0
    layer.addSublayer(fgLayer)
    
    // Setup percent label
    percentLabel.font = UIFont(name: "Avenir Next", size: 14)
    percentLabel.textColor = UIColor.whiteColor()
    percentLabel.text = "0.0/0"
    percentLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
    addSubview(percentLabel)
    
    // Setup caption label
//    captionLabel.font = UIFont(name: "Avenir Next", size: 26)
//    captionLabel.text = "Chapters Read"
//    captionLabel.textColor = UIColor.whiteColor()
//    captionLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
//    addSubview(captionLabel)
    
    // Setup constraints
    let percentLabelCenterX = NSLayoutConstraint(item: percentLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1.0, constant: 0)
    let percentLabelCenterY = NSLayoutConstraint(item: percentLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1.0, constant: -margin)
    NSLayoutConstraint.activateConstraints([percentLabelCenterX, percentLabelCenterY])
    
//    let captionLabelCenterX = NSLayoutConstraint(item: captionLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1.0, constant: -margin)
//    let captionLabelBottomY = NSLayoutConstraint(item: captionLabel, attribute: .Bottom, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: 1.0, constant: -margin)
//    NSLayoutConstraint.activateConstraints([captionLabelCenterX, captionLabelBottomY])

  }
  
  func configure() {
    bgLayer.strokeColor = bgColor.CGColor
    fgLayer.strokeColor = fgColor.CGColor
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    setupShapeLayer(bgLayer)
    setupShapeLayer(fgLayer)
  }
  
  func setupShapeLayer(shapeLayer: CAShapeLayer) {
  
    shapeLayer.frame = self.bounds
    
    let center = percentLabel.center
    let radius = CGFloat(CGRectGetWidth(self.bounds) * 0.07)
    let startAngle = DegreesToRadians(-90)
    let endAngle = DegreesToRadians(270)
    
    let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
    shapeLayer.path = path.CGPath
  
  }
  
  func animate() {
  
    percentLabel.text = String(format: "%.01f/%.0f", curValue, range)
  
    var fromValue = fgLayer.strokeEnd
    var toValue = curValue / range
    if let presentationLayer = fgLayer.presentationLayer() as? CAShapeLayer {
      fromValue = fgLayer.presentationLayer().strokeEnd
    }
    let pctChange = abs(fromValue - toValue)
    NSLog("\(fromValue) \(toValue) \(pctChange * 4)")
    // 1
    let animation = CABasicAnimation(keyPath: "strokeEnd")
    animation.fromValue = fromValue
    animation.toValue = toValue
    // 2
    animation.duration = CFTimeInterval(pctChange * 2)
    // 3
    fgLayer.removeAnimationForKey("stroke")
    fgLayer.addAnimation(animation, forKey: "stroke")
    
    CATransaction.begin()
    CATransaction.setDisableActions(true)
    fgLayer.strokeEnd = toValue
    CATransaction.commit()
    
  }
  
}