//
//  aroundMeMapTableViewCell.swift
//  SlidingContainerViewController
//
//  Created by David Ghouzi on 16/07/15.
//  Copyright (c) 2015 Cem Olcay. All rights reserved.
//

import UIKit
import MapKit

class aroundMeMapTableViewCell: UITableViewCell, MKMapViewDelegate {

    @IBOutlet weak var mapview: MKMapView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let initialLocation = CLLocation(latitude:50.66141, longitude: 3.09576)
        let span = MKCoordinateSpanMake(0.05, 0.05)
        
        var homeLocation =  MKCoordinateRegionMake(initialLocation.coordinate, span)
        
        
        mapview.setRegion(homeLocation, animated: true)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        if (annotation is MKUserLocation) {
            //if annotation is not an MKPointAnnotation (eg. MKUserLocation),
            //return nil so map draws default view for it (eg. blue dot)...
            return nil
        }
        
        
        
        let reuseId = "test"
        
        var anView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId)
        if anView == nil {
            anView = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            anView.image = UIImage(named:"xaxas")
            anView.canShowCallout = true
        }
        else {
            //we are re-using a view, update its annotation reference...
            anView.annotation = annotation
        }
        
        return anView
    }


}
