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
    var description: String
    var photo: UIImage?
    let numberOfSeats: Int
    var amenities: [Amenity]
    var price: Price
    
    //MARK: Initialization
    
    init?(name: String, description: String, photo: UIImage?,numberOfSeats: Int, amenities: [Amenity], price: Price) {
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty {
            return nil
        }
        // Initialize stored properties.
        self.name = name
        self.description = description
        self.photo = photo
        self.numberOfSeats = numberOfSeats
        self.amenities = amenities
        self.price = price
    }
    
    func contains(_ string: String) -> Bool{
        return name.lowercased().contains(string.lowercased())
    }
    
    
    func getCapacity(at date: Date) -> Capacity{
        let calendar = Calendar.current
        let comp = calendar.dateComponents([.hour, .minute], from: date)
        let hour = comp.hour ?? 0
        let minute = comp.minute ?? 0
        
        let cafeCode = self.name.replacingOccurrences(of: " ", with: "_")
        let occupants = Data.capacityData(for: self, at: date)
        print("\(cafeCode)-\(hour)-\(minute)")
         return Capacity(rawImage: UIImage(named: "\(cafeCode)-\(hour)-\(minute)")!, detectedImage: UIImage(named: "\(cafeCode)-\(hour)-\(minute)-results")!, capacity: self.numberOfSeats, occupants: occupants)
    
        //return Capacity(rawImage: UIImage(named: "\(cafeCode)-\(hour)-\(minute)")!, detectedImage: UIImage(named: "\(cafeCode)-\(hour)-\(minute)-edited")!, capacity: self.numberOfSeats, occupants: occupants)
    }
}
