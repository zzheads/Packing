//
//  Boxes.swift
//  Packing
//
//  Created by Alexey Papin on 29.12.16.
//  Copyright © 2016 zzheads. All rights reserved.
//

import Foundation

extension Array where Element: BoxType {
    // sort by length of longest edge of the box
    func sortByLongestEdge() -> [BoxType] {
        return self.sorted { (box1, box2) -> Bool in
            if (box1.longestEdge > box2.longestEdge) {
                return true
            }
            return false
        }
    }
    
    // determine first longest edge of all boxes
    var firstLongestEdge: BoxType? {
        if (self.count > 0) {
            return self.sortByLongestEdge()[0]
        }
        return nil
    }
    
    // determine second longest edge of all boxes
    var secondLongestEdge: BoxType? {
        if (self.count > 1) {
            return self.sortByLongestEdge()[1]
        }
        return nil
    }
    
    // determine box which has the widest surface area. If there is more than one, choose the box which has the minimum height
    var widestSurfaceBox: BoxType? {
        let sorted = self.sorted { (box1, box2) -> Bool in
            if (box1.widestSurface.square > box2.widestSurface.square) {
                return true
            }
            return false
        }
        return sorted.first
    }
    
    // determine number of unique (different sizes) boxes
    var numberUniqueBoxes: Int {
        
    }
    
    //pack
    func pack(boxes: [BoxType]) -> [BoxType] {
        // Step1: Input box dimensions and numbers
        
    }
    
}
