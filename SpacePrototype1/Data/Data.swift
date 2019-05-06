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
        
        let photo1 = UIImage(named: "Uris_Cafe")
        let photo2 = UIImage(named: "Joes_Coffee")
        let photo3 = UIImage(named: "Carleton_Commons")
        let photo4 = UIImage(named: "Hungarian_Pastry")
        let photo5 = UIImage(named: "Dr_Smood")
        let photo6 = UIImage(named: "Starbucks")
        
        guard let space1 = Cafe(name: "Uris Cafe", description: "A spacious cafe with tables for group and individual work.", photo: photo1, numberOfSeats: 20, amenities: [.wifi, .outlets, .airConditioning ], price: .high) else {
            fatalError("Unable to instantiate meal1")
        }
        guard let space2 = Cafe(name: "Joe Coffee", description: "A small coffee shop with coffee from boutique roasters.", photo: photo2, numberOfSeats: 20, amenities: [.wifi, .outlets, .airConditioning ], price: .high) else {
            fatalError("Unable to instantiate meal1")
        }
        guard let space3 = Cafe(name: "Carleton Commons", description: "A common space often filled with studying students.", photo: photo3, numberOfSeats: 20, amenities: [.wifi, .outlets, .airConditioning ], price: .high) else {
            fatalError("Unable to instantiate meal1")
        }
        guard let space4 = Cafe(name: "Hungarian_Pastry", description: "Known best for their turnover pastries.", photo: photo4, numberOfSeats: 20, amenities: [.wifi, .outlets, .airConditioning ], price: .high) else {
            fatalError("Unable to instantiate meal1")
        }
        guard let space5 = Cafe(name: "Doctor Smood", description: "Probably the healthiest cafe in the city.", photo: photo5, numberOfSeats: 20, amenities: [.wifi, .outlets, .airConditioning ], price: .high) else {
            fatalError("Unable to instantiate meal1")
        }
        guard let space6 = Cafe(name: "Starbucks", description: "We all know how this goes.", photo: photo6, numberOfSeats: 20, amenities: [.wifi, .outlets, .airConditioning ], price: .high) else {
            fatalError("Unable to instantiate meal1")
        }
        
        return [space1,space2,space3,space4,space5,space6]
    }
    
    static func capacityData(for code: String) -> Int{
        return 15
      //  return capcityDataDict[code] ?? 0
    }
    
    private static let capcityDataDict: [String:Int] = [
        "Uris_Cafe-4-15" : 4
    ]
    
}



