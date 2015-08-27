//
//  TutorialStepViewController.swift
//  PeemzMVP
//
//  Created by David Ghouzi on 25/06/15.
//  Copyright (c) 2015 David Ghouzi. All rights reserved.
//

import UIKit

class TutorialStepViewController: UIViewController {

    var backgroundImage: UIImage?
    var text: String?
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var TextLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    
    @IBOutlet weak var createAccountLabel: UIButton!


    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        backgroundImageView.image = backgroundImage
        
        if let text = text {
            let font = UIFont(name: "HelveticaNeue-Light", size:17)!
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 8
            paragraphStyle.alignment = .Center
            TextLabel.backgroundColor = UIColor.whiteColor()
            TextLabel.attributedText = NSAttributedString(string: text,
                attributes: [NSFontAttributeName: font, NSParagraphStyleAttributeName: paragraphStyle])
        }
    }

    @IBAction func doneButtonAction(sender: UIButton) {
        
    }
    @IBAction func createAccount(sender: UIButton) {
    }
}
