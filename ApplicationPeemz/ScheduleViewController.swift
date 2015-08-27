//
//  ScheduleViewController.swift
//  RWDevCon
//
//  Created by Mic Pringle on 06/03/2015.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import UIKit

class ScheduleViewController: UICollectionViewController {
  
  //let sessions = Session.allSessions()
    //let titlename = [String]()
    
    let titlename = ["Paramètres du compte","Gestion des notifications","Moyens de paiement","Mes commandes en cours","Mes derniers achat","CGV","Version 2.0","Deconnexion"]
    
//  override func preferredStatusBarStyle() -> UIStatusBarStyle {
//    return UIStatusBarStyle.LightContent
//  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let width = CGRectGetWidth(collectionView!.bounds)
    let layout = collectionViewLayout as! DIYLayout
    layout.headerReferenceSize = CGSize(width: width, height: 280)
    layout.itemSize = CGSize(width: width, height: 50)
    layout.maximumStretchHeight = width
    //self.view.backgroundColor = UIColor.blueColor()
    //collectionView?.contentInset = UIEdgeInsets(top: -40, left: 0, bottom: 0, right: 0)
  }
  
}

extension ScheduleViewController {
  
  override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    //return sessions.count
    return 2 * titlename.count
    
  }
  
  override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
    let header = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "ScheduleHeader", forIndexPath: indexPath) as! ScheduleHeaderView
    return header
  }
  
  override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ScheduleCell", forIndexPath: indexPath) as! ScheduleCell
    cell.rowTitle.text = titlename[indexPath.row/2]
    return cell
  }
  
}