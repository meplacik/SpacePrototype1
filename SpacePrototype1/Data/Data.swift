//
//  Data.swift
//  SpacePrototype1
//
//  Created by Ethan Furstoss on 5/4/19.
//  Copyright © 2019 Madeline Placik. All rights reserved.
//

import Foundation
import UIKit

class Data{
    
    static func loadSampleSpaces() -> [Cafe] {
        
        let photo1 = UIImage(named: "Coffee Cafe")
        let photo2 = UIImage(named: "Museum Cafe")
        let photo3 = UIImage(named: "Office Cafe")
        let photo4 = UIImage(named: "Board Game Cafe")
        
        guard let space1 = Cafe(name: "Coffee Cafe", description: "A busy cafe known for its espresso.", photo: photo1, numberOfSeats: 20, amenities: [.wifi, .outlets], price: .low) else {
            fatalError("Unable to instantiate cafe1")
        }
        guard let space2 = Cafe(name: "Museum Cafe", description: "Enjoy a small snack while browsing the museum.", photo: photo2, numberOfSeats: 20, amenities: [.wifi, .outlets, .bathrooms ], price: .high) else {
            fatalError("Unable to instantiate cafe2")
        }
        guard let space3 = Cafe(name: "Office Cafe", description: "Break room with stocked fridge and kitchen.", photo: photo3, numberOfSeats: 20, amenities: [.wifi, .outlets, .airConditioning,.bathrooms ], price: .average) else {
            fatalError("Unable to instantiate cafe3")
        }
        guard let space4 = Cafe(name: "Board Game Cafe", description: "Happy hour and board games Monday-Friday.", photo: photo4, numberOfSeats: 20, amenities: [.wifi, .airConditioning ], price: .low) else {
            fatalError("Unable to instantiate cafe4")
        }
        
        return [space1,space2,space3,space4]
    }
    
    static func capacityData(for code: String) -> Int{
        return 15
      //  return capcityDataDict[code] ?? 0
    }
    
    private static let capcityDataDict: [String:Int] = [
        "Uris_Cafe-4-15" : 4
    ]
    
}



