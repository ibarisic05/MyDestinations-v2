//
//  DestinationAnnotation.swift
//  MyDestinations
//
//  Created by Ivan Barisic on 22/05/2020.
//  Copyright © 2020 Ivan Barisic. All rights reserved.
//

import UIKit
import MapKit

class DestinationAnnotation: NSObject, MKAnnotation {
    
    // MARK: - Variables
    var title: String?
    var coordinate: CLLocationCoordinate2D
    
    // MARK: - Init
    init(with title: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
        
        super.init()
    }
}
