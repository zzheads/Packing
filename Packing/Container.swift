//
//  Container.swift
//  Packing
//
//  Created by Alexey Papin on 29.12.16.
//  Copyright © 2016 zzheads. All rights reserved.
//

import Foundation

class Container: Box {
    var boxes: [(box: Box, attached: Point)] = []
    
    func add(box: Box) {
        
    }
    
    func isFit(box: Box) -> Bool {
        return false
    }
}
