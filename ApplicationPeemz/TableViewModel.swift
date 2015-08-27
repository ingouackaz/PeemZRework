//
//  TableViewModel.swift
//  TableViewExpansions
//
//  Created by Vesza Jozsef on 05/05/15.
//  Copyright (c) 2015 Vesza Jozsef. All rights reserved.
//

import UIKit

class TableViewModel {
    
    private let mainModel = [
        "Homme",
        "Femme",
        "Enfant",
        "Store List A-Z",
        "Accessoire",
    ]
    
    private let mainModelPicture = [
        "Homme",
        "Femme2",
        "Enfant",
        "Soin",
        "Accessoire",
    ]
    
    private let detailsModel = [
        "Details 0",
        "Details 1",
        "Details 2",
        "Details 3",
        "Details 4",
        "Details 5",
    ]
    
    func count() -> Int {
        return mainModel.count
    }
    
    func itemForIndex(index: Int) -> String {
        println("index \(index) && size \(mainModel.count)")

        
        if (index >= mainModel.count){
            return mainModel[3]
        }
        else{
            return mainModel[index]
            
        }
    }
    
    func detailsForIndex(index: Int) -> String {
        
        if (index >= detailsModel.count){
            return detailsModel[3]
        }
        else{
            return detailsModel[index]
            
        }
    }
    
    func pictureMain(index: Int) -> String {
        println("index \(index) && size \(mainModelPicture.count)")
        
        if (index >= mainModelPicture.count){
            return mainModelPicture[3]
        }
        else{
            return mainModelPicture[index]

        }
    }
    
}