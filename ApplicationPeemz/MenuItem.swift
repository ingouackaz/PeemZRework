//
//  MenuItem.swift
//  OfficeCommunicator
//
//  Created by David Grandinetti on 8/8/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

import UIKit

extension UIColor {
  class func smileColor() -> UIColor {
    return UIColor(red: 249/255, green: 84/255, blue: 7/255, alpha: 1)
  }
  class func coffeeColor() -> UIColor {
    return UIColor(red: 69/255, green: 59/255, blue: 55/255, alpha: 1)
  }
  class func drinksColor() -> UIColor {
    return UIColor(red: 249/255, green: 194/255, blue: 7/255, alpha: 1)
  }
  class func thumbsUpColor() -> UIColor {
    return UIColor(red: 32/255, green: 188/255, blue: 32/255, alpha: 1)
  }
  class func thumbsDownColor() -> UIColor {
    return UIColor(red: 207/255, green: 34/255, blue: 156/255, alpha: 1)
  }
  class func rainingColor() -> UIColor {
    return UIColor(red: 14/255, green: 88/255, blue: 149/255, alpha: 1)
  }
  class func clockColor() -> UIColor {
    return UIColor(red: 15/255, green: 193/255, blue: 231/255, alpha: 1)
  }
}

class MenuItem {
  let name :String
  let color: UIColor
  let contentviewcontrollerIdentifier: String

    init(name: String, color: UIColor, contentviewcontrollerIdentifier:String) {
    self.name = name
    self.color = color
    self.contentviewcontrollerIdentifier = contentviewcontrollerIdentifier
  }
  
  var sideMenuImage: UIImage {
    return UIImage(named: name)!
  }
  
//  var mainImage: UIImage {
//    return UIImage(named: name + "_big")!
//  }
  
  class var sharedItems: [MenuItem] {
    struct Static {
      static let items = sharedMenuItems()
    }
    return Static.items
  }
}

private func sharedMenuItems() -> [MenuItem] {
  var items = [MenuItem]()

  items.append(MenuItem(name: "Home",       color: UIColor.smileColor(),   contentviewcontrollerIdentifier: "Demo"))
  items.append(MenuItem(name: "Profile",      color: UIColor.coffeeColor(),   contentviewcontrollerIdentifier: "ScheduleViewController"))
  items.append(MenuItem(name: "Friends",      color: UIColor.drinksColor(),   contentviewcontrollerIdentifier: "ExCVC"))
  items.append(MenuItem(name: "Stores",   color: UIColor.thumbsUpColor(),   contentviewcontrollerIdentifier: "InspirationsViewController"))
  items.append(MenuItem(name: "Map", color: UIColor.thumbsDownColor(),   contentviewcontrollerIdentifier: "myStoresCVController"))
  items.append(MenuItem(name: "Notifications",     color: UIColor.rainingColor(),   contentviewcontrollerIdentifier: "Demo"))
  items.append(MenuItem(name: "Wishlist",       color: UIColor.clockColor(),   contentviewcontrollerIdentifier: "Demo"))
  items.append(MenuItem(name: "Gift",       color: UIColor.clockColor(),   contentviewcontrollerIdentifier: "Demo"))
  items.append(MenuItem(name: "Cagnotte",       color: UIColor.clockColor(),   contentviewcontrollerIdentifier: "Demo"))
  return items
}

