//
//  researchTVController.swift
//  SlidingContainerViewController
//
//  Created by David Ghouzi on 16/07/15.
//  Copyright (c) 2015 Cem Olcay. All rights reserved.
//

import UIKit

let mainCellIdentifier = "MainCell"
let detailCellIdentifier = "DetailsCell"


class researchTVController: UITableViewController,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    let viewModel = TableViewModel()

    var indexAdded : Int = 0
    
    var homme = ["ACCESSOIRES","CHAUSSURES","CHEMISES","COSTUMES","JEANS ET DENIMS","LUNETTES DE SOLEIL","MANTEAUX ET BLOUSONS","PANTALONS","PROMOTIONS","PULL","SACS","SWEAT-SHIRTS","T-SHIRTS ET TOPS","TOUT VOIR"]
    
    var femme = ["ACCESSOIRES","CHAUSSURES","CHEMISES","JEANS ET DENIMS","JUPE","LUNETTES DE SOLEIL","MANTEAUX ET BLOUSONS","PANTALONS","PULLS ET SWEAT-SHIRTS","ROBES","SAC","SPORT","PROMOTIONS","T-SHIRTS ET TOPS","TOUT VOIR"]
    
    var enfant = ["FILLE","0-24 Mois","3-8 ANS","9-16 ANS","GARCON","0-24 MOIS","3-8 ANS","9-16 ANS"]
    
    var storesList = ["Atelson","Bruno Cuccinelli","Burberry","Céline","Kooples","Lacoste","Prada","Weston","Yves Saint-Laurent"]
    
    
    var expandedIndex: NSIndexPath? {
        didSet {
            switch expandedIndex {
            case .Some(let index):
                tableView.insertRowsAtIndexPaths([index], withRowAnimation: UITableViewRowAnimation.Bottom)
            case .None:
                tableView.deleteRowsAtIndexPaths([oldValue!], withRowAnimation: UITableViewRowAnimation.Fade)
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset.top = 35
        
    }
    
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var tag = Int()
        
        tag = collectionView.tag
        
        if tag == 5 {
            return enfant.count
        } else if tag == 1{
            return homme.count
        } else if tag == 2{
            return femme.count
        } else {
            return storesList.count
        }

    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
    var tag = Int()
    
    tag = collectionView.tag
        
        if tag == 5 {
         let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell2", forIndexPath: indexPath) as! ResearchCollectionViewCell

            if indexPath.row == 0 {
                cell.titreCategorie.setTitle(enfant[indexPath.row], forState: .Normal)
                cell.titreCategorie.titleLabel?.font = UIFont.boldSystemFontOfSize(16.0)
            } else if indexPath.row == 4 {
                cell.titreCategorie.setTitle(enfant[indexPath.row], forState: .Normal)
                cell.titreCategorie.titleLabel?.font = UIFont.boldSystemFontOfSize(16.0)
            } else {
                cell.titreCategorie.setTitle(enfant[indexPath.row], forState: .Normal)
            }
            
            return cell
            
        } else if tag == 1{
           let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell3", forIndexPath: indexPath) as! HommeCollectionViewCell
            cell.titreCategorie.setTitle(homme[indexPath.row], forState: .Normal)
            return cell
        } else if tag == 2{
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell4", forIndexPath: indexPath) as! ResearchCollectionViewCell
            cell.titreCategorie.setTitle(femme[indexPath.row], forState: .Normal)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell5", forIndexPath: indexPath) as! ResearchCollectionViewCell
            cell.titreCategorie.setTitle(storesList[indexPath.row], forState: .Normal)
            return cell
        }
        
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        //var widthscreen = self.view.frame.width
        return CGSize(width: collectionView.frame.width, height: 30)
        
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 5
    }
    
    
    // TABLEVIEW PROPERTIES
    
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (expandedIndex != nil){
            
            println("sie tab \(viewModel.count() + 1)")

            return viewModel.count() + 1
        }
        else{
            println("sie tab \(viewModel.count() + 1)")

         return  viewModel.count()
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var height = CGFloat()
            
        switch expandedIndex {
        case .None:
            height = 140
            
        case .Some(let index) where index.row == indexPath.row :

            if viewModel.itemForIndex(indexPath.row - 1) == "Homme" {

                height = CGFloat(35 * homme.count)
                
            } else if viewModel.itemForIndex(indexPath.row - 1) == "Femme" {

                height = CGFloat(35 * femme.count)
                
            } else if viewModel.itemForIndex(indexPath.row - 1) == "Enfant" {

                height = CGFloat(35 * enfant.count)
                
                
            } else {
                height = CGFloat(35 * storesList.count)
            }
            
            
        default:
            height = 140
        }
        
        return height
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell
        
        switch expandedIndex {
            
            
            
            
        case .Some(let index) where index.row == indexPath.row :

            
            if indexPath.row == 1 {
                
                indexAdded = indexPath.row
                cell = tableView.dequeueReusableCellWithIdentifier("TestHomme") as! UITableViewCell
                cell.selectionStyle = UITableViewCellSelectionStyle.None
                
            } else if indexPath.row == 2 {
                indexAdded = indexPath.row
                cell = tableView.dequeueReusableCellWithIdentifier("TestFemme2") as! UITableViewCell
                cell.selectionStyle = UITableViewCellSelectionStyle.None

            } else if indexPath.row == 3 {
                indexAdded = indexPath.row

                cell = tableView.dequeueReusableCellWithIdentifier("TestEnfant") as! UITableViewCell
                cell.selectionStyle = UITableViewCellSelectionStyle.None

            } else {
                indexAdded = indexPath.row

                cell = tableView.dequeueReusableCellWithIdentifier("TestStores") as! UITableViewCell
                cell.selectionStyle = UITableViewCellSelectionStyle.None

            }
            
            
            // non étendu
            
            // 0 - 0 Homme -> pictureMain[0,1,2,3,4]
            // 0 - 1 Femme
            // 0 - 2 Étendu
            // 0 - 3 Enfant
            // 0 - 4 Store
            // 0 - 5 Accessioire
            //  pictureMain[0,1,2,3,4,5]
            //
            
            

        case .None :
            
            cell = tableView.dequeueReusableCellWithIdentifier(mainCellIdentifier, forIndexPath: indexPath) as! UITableViewCell
            let imageName = viewModel.pictureMain(indexPath.row)
            let image = UIImage(named: imageName)
            let imageView = UIImageView(image: image!)
            imageView.frame = CGRect(x: 0, y: 0, width: cell.frame.size.width, height: cell.frame.size.height)
            cell.addSubview(imageView)
            
            var label = UILabel(frame: CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height))
            label.center = CGPointMake(UIScreen.mainScreen().bounds.size.width/2, cell.frame.size.height/2)
            label.textAlignment = NSTextAlignment.Center
            label.backgroundColor = UIColor.clearColor()
            label.text = viewModel.itemForIndex(indexPath.row)
            label.font = UIFont(name: "Avenir Next-Bold",
                size: 20.0)
            label.backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.7)
            
            imageView.addSubview(label)
            // quand étendu
            
        default:
            
            println("added \(indexAdded) idpathrow \(indexPath.row) view model count \(viewModel.count())")
            
            
            
            
            var row : Int
            
            // Si l'index affiché est un dessous de l'index étendu, alors on décale de 1
            row = indexPath.row
            if (indexPath.row > indexAdded){
                row--
            }
            
            cell = tableView.dequeueReusableCellWithIdentifier(mainCellIdentifier, forIndexPath: indexPath) as! UITableViewCell
            let imageName = viewModel.pictureMain(row)
            let image = UIImage(named: imageName)
            let imageView = UIImageView(image: image!)
            imageView.frame = CGRect(x: 0, y: 0, width: cell.frame.size.width, height: cell.frame.size.height)
            cell.addSubview(imageView)
            
            var label = UILabel(frame: CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height))
            label.center = CGPointMake(UIScreen.mainScreen().bounds.size.width/2, cell.frame.size.height/2)
            label.textAlignment = NSTextAlignment.Center
            label.backgroundColor = UIColor.clearColor()
            label.text = viewModel.itemForIndex(row)
            label.font = UIFont(name: "Avenir Next-Bold",
                size: 20.0)
            label.backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.7)
        
            imageView.addSubview(label)
        }
            return cell
        
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        switch expandedIndex {
        case .None:
            expandedIndex = NSIndexPath(forRow: indexPath.row + 1, inSection: indexPath.section)
            tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.Top, animated: true)
            
        case .Some(let index) where index.row == indexPath.row:
            tableView.deselectRowAtIndexPath(indexPath, animated: false)
            
            
        case .Some(let index) where index.row == indexPath.row + 1 :
            expandedIndex = nil
            tableView.deselectRowAtIndexPath(indexPath, animated: false)
       
            
        case .Some(let index) where index.row < indexPath.row :
            expandedIndex = nil
            self.tableView(tableView, didSelectRowAtIndexPath: NSIndexPath(forRow: max(0,indexPath.row - 1), inSection: indexPath.section))
            
        default:
            expandedIndex = nil
            expandedIndex = NSIndexPath(forRow: indexPath.row + 1, inSection: indexPath.section)
            
        }
        
    }

}
