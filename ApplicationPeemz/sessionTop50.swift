//
//  sessionTop50.swift
//  SlidingContainerViewController
//
//  Created by David Ghouzi on 15/07/15.
//  Copyright (c) 2015 Cem Olcay. All rights reserved.
//

import UIKit

class sessionTop50 {
    
    var title: String
    var location: String
    var type: String
    var price: String
    var rating : String
    var backgroundImage2: UIImage
    
    
    init(title: String, location: String, type: String, price: String, rating: String, backgroundImage2: UIImage) {
        self.title = title
        self.location = location
        self.type = type
        self.price = price
        self.rating = rating
        self.backgroundImage2 = backgroundImage2
    }
    
    convenience init(dictionary: NSDictionary) {
        let title = dictionary["Title"] as? String
        let location = dictionary["Location"] as? String
        let type = dictionary["Type"] as? String
        let price = dictionary["Price"] as? String
        let rating = dictionary["Rating"] as? String
        let backgroundName = dictionary["Background"] as? String
        let backgroundImage2 = UIImage(named: backgroundName!)
        self.init(title: title!, location: location!, type: type!, price: price!, rating: rating!, backgroundImage2: backgroundImage2!.decompressedImage)
    }
    
}