//
//  Space.swift
//  SpacePrototype1
//
//  Created by Madeline Placik on 4/14/19.
//  Copyright © 2019 Madeline Placik. All rights reserved.
//

import UIKit

class Cafe {
    
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    let numberOfSeats: Int
    var amenities: [Amenity]
    var price: Price
    
    //MARK: Initialization
    
    init?(name: String, photo: UIImage?,numberOfSeats: Int, amenities: [Amenity], price: Price) {
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty {
            return nil
        }
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.numberOfSeats = numberOfSeats
        self.amenities = amenities
        self.price = price
    }
    
    func contains(_ string: String) -> Bool{
        return name.contains(string)
    }
}
