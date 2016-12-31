//
//  Array+BoxType.swift
//  Packing
//
//  Created by Alexey Papin on 29.12.16.
//  Copyright © 2016 zzheads. All rights reserved.
//

import Foundation

extension Array where Element: BoxType {
    
    // array of edges of all boxes, sorted
    var edgesSorted: [Double] {
        var allEdges: [Double] = []
        for box in self {
            allEdges.append(contentsOf: box.edges)
        }
        return allEdges.sorted()
    }
    
    // sort by length of longest edge of the box
    func sortByLongestEdge() -> [BoxType] {
        return self.sorted { (box1, box2) -> Bool in
            if (box1.longestEdge > box2.longestEdge) {
                return true
            }
            return false
        }
    }
    
    // determine box which has the widest surface area. If there is more than one, choose the box which has the minimum height
    var widestSurfaceBox: BoxType? {
        let sorted = self.sorted { (box1, box2) -> Bool in
            if (box1.widestSurface.square == box2.widestSurface.square) {
                if (box1.heightWhenWidestSurfaceDown > box2.heightWhenWidestSurfaceDown) {
                    return false
                }
                return true
            } else {
                if (box1.widestSurface.square > box2.widestSurface.square) {
                    return true
                }
                return false
            }
        }
        return sorted.first
    }
    
    //determine max height of boxes
    var maxHeight: Double {
        var maxHeight: Double = 0
        for box in self {
            if box.height > maxHeight {
                maxHeight = box.height
            }
        }
        return maxHeight
    }
}
