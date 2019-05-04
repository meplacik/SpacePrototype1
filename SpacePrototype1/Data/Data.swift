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
        
        guard let space1 = Cafe(name: "Uris Cafe", photo: photo1, amenities: [.wifi, .outlets, .airConditioning ], price: .high) else {
            fatalError("Unable to instantiate meal1")
        }
        guard let space2 = Cafe(name: "Joe Coffee", photo: photo2, amenities: [.wifi, .outlets, .airConditioning ], price: .high) else {
            fatalError("Unable to instantiate meal1")
        }
        guard let space3 = Cafe(name: "Carleton Commons", photo: photo3, amenities: [.wifi, .outlets, .airConditioning ], price: .high) else {
            fatalError("Unable to instantiate meal1")
        }
        guard let space4 = Cafe(name: "Hungarian_Pastry", photo: photo4, amenities: [.wifi, .outlets, .airConditioning ], price: .high) else {
            fatalError("Unable to instantiate meal1")
        }
        guard let space5 = Cafe(name: "Doctor Smood", photo: photo5, amenities: [.wifi, .outlets, .airConditioning ], price: .high) else {
            fatalError("Unable to instantiate meal1")
        }
        guard let space6 = Cafe(name: "Starbucks", photo: photo6, amenities: [.wifi, .outlets, .airConditioning ], price: .high) else {
            fatalError("Unable to instantiate meal1")
        }
        
        return [space1,space2,space3,space4,space5,space6]
    }
    
    
    
    
    static func getCapacity(for cafe: Cafe, weekDay: Int, time: Int) -> (UIImage?, UIImage?){
        let cafeCode = cafe.name.replacingOccurrences(of: " ", with: "_")
        
       
        
        return Capacity(rawImage: UIImage(named: "\(cafeCode)-\(weekDay)-\(time)")!, detectedImage: UIImage(named: "\(cafeCode)-\(weekDay)-\(time)-edited")!, capacity: 0, occupants: 0)
    }
    
    static func getCapacity(for cafe: Cafe, weekDay: Int, time: Int) -> Capacity{
        let capacity = Capacity(rawImage: <#T##UIImage#>, detectedImage: <#T##UIImage#>, capacity: <#T##Int#>, occupants: <#T##Int#>)
    }
    
}
