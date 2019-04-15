//
//  Capacity.swift
//  SpacePrototype1
//
//  Created by Ethan Furstoss on 4/15/19.
//  Copyright © 2019 Madeline Placik. All rights reserved.
//

import Foundation
import UIKit

struct Capacity{
    var rawImage: UIImage
    var detectedImage: UIImage
    var capacity: Int
    var occupants: Int
    
    func capacityPercentage() -> Int{
        return Int((CGFloat(occupants) / CGFloat(capacity) * 100))
    }
}
