//
//  CenterViewController.swift
//  OfficeCommunicator
//
//  Created by David Grandinetti on 8/8/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

import UIKit

class CenterViewController: UIViewController {
  
  var menuItem: MenuItem! {
    didSet {
      title = menuItem.name
      //view.backgroundColor = menuItem.color
      //menuItemView?.image = menuItem.mainImage
        var vc = storyboard!.instantiateViewControllerWithIdentifier(menuItem.contentviewcontrollerIdentifier) as! UIViewController
        
        println("childs count \(self.childViewControllers.count)")
        println("subviews count \( self.container.subviews.count)")
        
        if (self.childViewControllers.count > 0 ){
            self.container.subviews.first?.removeFromSuperview()
            self.childViewControllers.first?.removeFromParentViewController()
        }
        
        self.container.addSubview(vc.view)
        self.addChildViewController(vc)

    }
  }
  

  
    @IBOutlet weak var container: UIView!
  // MARK: ViewController
  
  var menuButton: MenuButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    menuButton = MenuButton()
    menuButton.tapHandler = {
      if let containerVC = self.navigationController?.parentViewController as? ContainerViewController {
        containerVC.toggleSideMenu()
      }
    }
    
    navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuButton)
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Search, target: self, action: "searchAction:")
    navigationItem.rightBarButtonItem?.tintColor = UIColor.whiteColor()
    menuItem = MenuItem.sharedItems.first!
  }
    
    func searchAction(sender:UIBarButtonItem!)
    {
        println("Button Search tapped")
        
        //self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
    

}