//
//  StringExtension.swift
//  SpacePrototype1
//
//  Created by Ethan Furstoss on 4/15/19.
//  Copyright © 2019 Madeline Placik. All rights reserved.
//

import Foundation

extension String {
    
    func substring(_ to: Int) -> String {
        let end = index(startIndex, offsetBy: to)
        return String(self[startIndex ..< end])
    }
}
