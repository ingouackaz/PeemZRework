//
//  StatView2.swift
//  SlidingContainerViewController
//
//  Created by David Ghouzi on 15/07/15.
//  Copyright (c) 2015 Cem Olcay. All rights reserved.
//

import UIKit


@IBDesignable
class RatingView: UIView {

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
        bgLayer.lineWidth = CGFloat(3.0)
        bgLayer.fillColor = UIColor.clearColor().CGColor
        bgLayer.strokeEnd = 1
        layer.addSublayer(bgLayer)
        
        // Setup fg
        fgLayer.lineWidth = CGFloat(3.0)
        fgLayer.fillColor = UIColor.clearColor().CGColor
        fgLayer.strokeEnd = 0
        layer.addSublayer(fgLayer)
        
        // Setup percent label
        percentLabel.font = UIFont(name: "Avenir Next", size: 11)
        percentLabel.textColor = UIColor.whiteColor()
        percentLabel.text = "0.0"
        percentLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        addSubview(percentLabel)

        
        // Setup constraints
        let percentLabelCenterX = NSLayoutConstraint(item: percentLabel, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1.0, constant: 0)
        let percentLabelCenterY = NSLayoutConstraint(item: percentLabel, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1.0, constant: -margin)
        NSLayoutConstraint.activateConstraints([percentLabelCenterX, percentLabelCenterY])
        
        
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
        
        percentLabel.text = String(format: "%.01f", curValue, range)
        
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
