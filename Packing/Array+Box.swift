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
    func pack(boxes: [Box]) -> [Box] {
        // Step1: Input box dimensions and numbers
        let N = self.numberUniqueBoxes
        // Step2: Determine the width and depth of the container
        let ak = self.edgesSorted[0]
        let bk = self.edgesSorted[1]
        let ck = 0.0
        let container = Container(title: "Container", width: ak, depth: bk, height: ck)
        // Step3: Chose the box which has the widest surface area. If there is more than one, chose the box which has minimum height.area
        // Place this box (ith) on the largest surface parallel to the base of container
        var box = boxes.widestSurfaceBox as! Box
        box.rotateWidestSurfaceDown()
        
        
        return []
    }
}
