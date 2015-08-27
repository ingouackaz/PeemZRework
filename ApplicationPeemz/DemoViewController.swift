//
//  DemoViewController.swift
//  SlidingContainerViewController
//
//  Created by Cem Olcay on 10/04/15.
//  Copyright (c) 2015 Cem Olcay. All rights reserved.
//

import UIKit

class DemoViewController: UIViewController, SlidingContainerViewControllerDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        navigationItem.title = ""
        navigationController?.navigationBar.titleTextAttributes = [
            NSFontAttributeName: UIFont(name: "Palatino", size: 20)!
        ]
//HelveticaNeue-Light
        //navigationController?.navigationBar.setBackgroundImage(UIImage(named: "NavBarBackground1"), forBarMetrics: UIBarMetrics.Default)
     //   navigationController?.navigationBar.barTintColor = UIColor.whiteColor()
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        */

        
        self.view.backgroundColor = UIColor.darkGrayColor()
        
        
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        //let vc1 = viewControllerWithColorAndTitle(UIColor.whiteColor(), title: "Home Page")
        
        let vc1 = hometvc()
        let vc2 = research()
        let vc3 = aroundMe()
        let vc4 = top50 ()
        let vc5 = Recommandations()
        
        let slidingContainerViewController = SlidingContainerViewController (
            parent: self,
            contentViewControllers: [vc1, vc2, vc3, vc4, vc5],
            titles: ["Home", "Research", "Around Me", "Top 50", "Recommandations"])
        
        view.addSubview(slidingContainerViewController.view)
        
        slidingContainerViewController.sliderView.appearance.outerPadding = 0
        slidingContainerViewController.sliderView.appearance.innerPadding = 50
        slidingContainerViewController.setCurrentViewControllerAtIndex(0)
        
    }
    
    func viewControllerWithColorAndTitle (color: UIColor, title: String) -> UIViewController {
        
        let vc = UIViewController ()
        vc.view.backgroundColor = color
        
        let label = UILabel (frame: vc.view.frame)
        label.textColor = UIColor.blackColor()
        label.textAlignment = .Center
        label.font = UIFont (name: "HelveticaNeue-Light", size: 25)
        label.text = title
        
        label.sizeToFit()
        label.center = view.center
        
        vc.view.addSubview(label)
        
        
        return vc
    }
    

    
    func hometvc () -> UIViewController {
        let vc = storyboard!.instantiateViewControllerWithIdentifier("HomeTVController") as! HomeTVController
        //vc.view.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        return vc
    }

    func aroundMe () -> UIViewController {
        //let vc = storyboard!.instantiateViewControllerWithIdentifier("aroundMeTVController") as! aroundMeTVController
        //vc.view.setTranslatesAutoresizingMaskIntoConstraints(false)
        //let vc = storyboard!.instantiateViewControllerWithIdentifier("AroundMe") as! AroundViewController
        //InspirationsViewController
        let vc = storyboard!.instantiateViewControllerWithIdentifier("Inspi") as! AroundMeCVController
        return vc
    }
    
    func research () -> UIViewController {
        let vc = storyboard!.instantiateViewControllerWithIdentifier("researchTVController") as! researchTVController
        //vc.view.setTranslatesAutoresizingMaskIntoConstraints(false)

        return vc
    }
    
    func top50 () -> UIViewController {
        let vc = storyboard!.instantiateViewControllerWithIdentifier("TableViewController") as! Top50TVController
        //vc.view.setTranslatesAutoresizingMaskIntoConstraints(false)

        return vc
    }

    func Recommandations () -> UIViewController {
        let vc = storyboard!.instantiateViewControllerWithIdentifier("Recommandations3") as! CollectionViewController
        
        //vc.view.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        return vc
    }
    //Recommandations
    
//
//    func CollectionVC () -> UIViewController {
//        let vc = storyboard!.instantiateViewControllerWithIdentifier("InspirationsViewController") as! InspirationsViewController
//        vc.view.setTranslatesAutoresizingMaskIntoConstraints(false)
//
//        return vc
//    }
//    
//    
//    func myStores () -> UIViewController {
//        let vc = storyboard!.instantiateViewControllerWithIdentifier("myStoresCVController") as! myStoresCVController
//        vc.view.setTranslatesAutoresizingMaskIntoConstraints(false)
//
//        return vc
//    }
//    
//    
//    func RecommandedStores () -> UIViewController {
//        let vc = storyboard!.instantiateViewControllerWithIdentifier("RecommandationsTVController") as! RecommandationsTVController
//        vc.view.setTranslatesAutoresizingMaskIntoConstraints(false)
//
//        return vc
//    }
    
    
    //researchTVController
    
    // MARK: SlidingContainerViewControllerDelegate
    
    func slidingContainerViewControllerDidShowSliderView(slidingContainerViewController: SlidingContainerViewController) {
        
    }
    
    func slidingContainerViewControllerDidHideSliderView(slidingContainerViewController: SlidingContainerViewController) {
        
    }
    
    func slidingContainerViewControllerDidMoveToViewController(slidingContainerViewController: SlidingContainerViewController, viewController: UIViewController) {
        
    }
    
    func slidingContainerViewControllerDidMoveToViewControllerAtIndex(slidingContainerViewController: SlidingContainerViewController, index: Int) {
        
    }

}
