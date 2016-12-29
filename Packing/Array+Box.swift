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
        var reducingArray: [Box] = self
        var uniqueBoxes = 0
        for box in self {
            if (reducingArray.contains(box)) {
                while (reducingArray.contains(box)) {
                    if let index = reducingArray.index(of: box) {
                        reducingArray.remove(at: index)
                    }
                }
                uniqueBoxes += 1
            }
        }
        return uniqueBoxes
    }
    
    //pack
    func pack(boxes: [BoxType]) -> [BoxType] {
        // Step1: Input box dimensions and numbers
        return []
    }
}
