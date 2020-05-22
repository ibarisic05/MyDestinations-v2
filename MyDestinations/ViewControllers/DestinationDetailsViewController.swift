//
//  DestinationDetailsViewController.swift
//  MyDestinations
//
//  Created by Ivan Barisic on 21/05/2020.
//  Copyright © 2020 Ivan Barisic. All rights reserved.
//

import UIKit
import MapKit
import SDWebImage

final class DestinationDetailsViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Variables
    private let anotIdentifier: String = "AnotIdentifier"
    var destination: Destination!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        initMap()
    }
    
    // MARK: - Internal config
    private func configUI() {
        titleLabel.text = destination.title
        titleLabel.setAppearance(appearance: TitleLabelAppearnce())
        subtitleLabel.text = destination.description
        subtitleLabel.setAppearance(appearance: SubtitleLabelAppearnce())
        idLabel.text = destination.id
        idLabel.setAppearance(appearance: SubtitleLabelAppearnce())
        
        if let image = destination.imageUrl {
            let url = URL(string: image)
            imageView.sd_setImage(with: url, completed: nil)
        }
    }
    
    private func initMap() {
        mapView.delegate = self

        if let lat = destination.lat, let long = destination.long {
            let destinationCoords = CLLocationCoordinate2D(latitude: lat, longitude: long)
            mapView.setCenter(destinationCoords, animated: true)
            
            let pin = DestinationAnnotation(with: destination.title, coordinate: destinationCoords)
            mapView.addAnnotation(pin)
        } else {
            mapView.isHidden = true
        }
    }
}

// MARK: - MKMapViewDelegate
extension DestinationDetailsViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: anotIdentifier)
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: anotIdentifier)
            annotationView!.canShowCallout = true
        } else {
            annotationView!.annotation = annotation
        }
        
        return annotationView
    }
    
}
