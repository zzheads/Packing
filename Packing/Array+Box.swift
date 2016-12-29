//
//  Boxes.swift
//  Packing
//
//  Created by Alexey Papin on 29.12.16.
//  Copyright © 2016 zzheads. All rights reserved.
//

import Foundation

extension Array where Element: Box {
    // determine number of unique (different sizes) boxes
    var numberUniqueBoxes: Int {
        return Set(self).count
    }
    
    //pack
    func pack(boxes: [BoxType]) -> [BoxType] {
        // Step1: Input box dimensions and numbers
        return []
    }
}
