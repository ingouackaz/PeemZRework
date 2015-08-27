//
//  TutorialViewController.swift
//  PeemzMVP
//
//  Created by David Ghouzi on 25/06/15.
//  Copyright (c) 2015 David Ghouzi. All rights reserved.
//



// Objet : Création d'un tutoriel qui se charge uniquement lors du premier lancement de l'application par l'utilisateur. 
//          Page 1 : interface d'accueil Peemz
//          Page 2 : Peemz, c'est quoi en 1 ligne
//          Page 3 : Peemz, il y a quoi
//          Direction vers le Home Button Page


import UIKit


class TutorialViewController: UIViewController {
    
    //var pages_tutorial = [TutorialStepViewController]()
    @IBOutlet weak var ScrollView: UIScrollView!
    var pages = [TutorialStepViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ScrollView.pagingEnabled = true
        
        let page1 = createAndAddTutorialStep("AppLogoPeemz", text: "Bienvenue Sur Peemz.", atIndex: 0)
        let page2 = createAndAddTutorialStep("AppLogoPeemz", text: "Peemz, c'est quoi ?", atIndex: 1)
        let page3 = createAndAddTutorialStep("AppLogoPeemz", text: "Peemz, c'est aussi ça ...", atIndex: 2)
        let page4 = createAndAddTutorialStep("Tuto4", text: "Avant de finir, choisissez votre catégorie", atIndex: 3)
        
        pages = [page1, page2, page3, page4]

        
        let views = ["view": view, "page1": page1.view, "page2": page2.view, "page3": page3.view, "page4": page4.view]
        
        let verticalConstraints =
        NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|[page1(==view)]|", options: nil, metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(verticalConstraints)
        
        let horizontalConstraints =
        NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|[page1(==view)][page2(==view)][page3(==view)][page4(==view)]|", options: .AlignAllTop | .AlignAllBottom, metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(horizontalConstraints)
        
        
        
        
    }
    
    private func createAndAddTutorialStep(backgroundImageName: String, text: String, atIndex: Int) -> TutorialStepViewController {
        let tutorialStep = storyboard!.instantiateViewControllerWithIdentifier("TutorialStepViewController") as! TutorialStepViewController
        tutorialStep.view.setTranslatesAutoresizingMaskIntoConstraints(false)
        tutorialStep.backgroundImage = UIImage(named: backgroundImageName)
        tutorialStep.text = text
        
        ScrollView.addSubview(tutorialStep.view)
        
        addChildViewController(tutorialStep)
        tutorialStep.didMoveToParentViewController(self)
        
        tutorialStep.doneButton.hidden = true
        tutorialStep.createAccountLabel.hidden = true
        
        if  atIndex == 3 {
            
        tutorialStep.doneButton.hidden = false
        tutorialStep.createAccountLabel.hidden = false
            
        }
        
        return tutorialStep
    }
}
