//
//  InitialVC.swift
//  Bondour
//
//  Created by Ingouackaz on 2015-07-01.
//  Copyright (c) 2015 Ingouackaz. All rights reserved.
//

import UIKit

class InitialVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController!.navigationBar.hidden = true


    }
    
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController!.navigationBar.hidden = false
    }


    func exitLoginMode(){
        
        
        var appD = UIApplication.sharedApplication().delegate as! AppDelegate
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        appD.window!.rootViewController = storyboard.instantiateInitialViewController() as! UINavigationController
        
        //self.dismissViewControllerAnimated(true, completion: nil)
    }

}
