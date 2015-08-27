//
//  storeShowCaseCVC.swift
//  SlidingContainerViewController
//
//  Created by David Ghouzi on 29/07/15.
//  Copyright (c) 2015 Cem Olcay. All rights reserved.
//

import UIKit

class storeShowCaseCVC: UICollectionViewCell {
 
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productPicture: UIImageView!
    
    var inspiration: top50? {
        didSet {
            if let inspiration = inspiration {
                productPicture.image = inspiration.backgroundImage2
                productPrice.text = inspiration.title
            }
        }
    }
}
