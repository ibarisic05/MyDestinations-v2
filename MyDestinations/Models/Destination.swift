//
//  Destination.swift
//  MyDestinations
//
//  Created by Ivan Barisic on 21/05/2020.
//  Copyright © 2020 Ivan Barisic. All rights reserved.
//

import UIKit

class Destination: Codable {
    
    // MARK: - Static variables
    static let userDefaultsKey = "DestinationKey"

    // MARK: - Variables
    let id: String
    var title: String
    var description: String
    
    // MARK: - Init
    init(title: String, description: String) {
        self.id = UUID().uuidString
        self.title = title
        self.description = description
    }
    
}
