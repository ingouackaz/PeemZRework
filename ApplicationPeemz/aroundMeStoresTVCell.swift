//
//  aroundMeTVCell.swift
//  SlidingContainerViewController
//
//  Created by David Ghouzi on 16/07/15.
//  Copyright (c) 2015 Cem Olcay. All rights reserved.
//

import UIKit

class aroundMeStoresTVCell: UITableViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var storePicture: UIImageView!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var storeLocation: UILabel!
    @IBOutlet weak var storeStyle: UILabel!
    @IBOutlet weak var storePrice: UILabel!


    var inspiration: top50? {
        didSet {
            if let inspiration = inspiration {
                storePicture.image = inspiration.backgroundImage2
                storeName.text = inspiration.title
                storeLocation.text = inspiration.location
                storeStyle.text = inspiration.type
                storePrice.text = inspiration.price
                
            }
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }


}
