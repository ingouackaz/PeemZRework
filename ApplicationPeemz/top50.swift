//
//  top50.swift
//  SlidingContainerViewController
//
//  Created by David Ghouzi on 15/07/15.
//  Copyright (c) 2015 Cem Olcay. All rights reserved.
//

import UIKit

class top50: sessionTop50 {
    
    class func allInspirations() -> [top50] {
        var inspirations = [top50]()
        if let URL = NSBundle.mainBundle().URLForResource("top50stores", withExtension: "plist") {
            if let tutorialsFromPlist = NSArray(contentsOfURL: URL) {
                for dictionary in tutorialsFromPlist {
                    let inspiration = top50(dictionary: dictionary as! NSDictionary)
                    inspirations.append(inspiration)
                }
            }
        }
        return inspirations
    }
    
}