//
//  Box.swift
//  Packing
//
//  Created by Alexey Papin on 29.12.16.
//  Copyright © 2016 zzheads. All rights reserved.
//

import Foundation

class Box: BoxType, CustomStringConvertible, Equatable {
    var title: String?
    var width: Double
    var depth: Double
    var height: Double
    
    required init(width: Double, depth: Double, height: Double) {
        self.width = width
        self.depth = depth
        self.height = height
    }
    
    convenience init(title: String?, width: Double, depth: Double, height: Double) {
        self.init(width: width, depth: depth, height: height)
        self.title = title
    }
    
    convenience init?(title: String?, stringWithSizesDividedByX: String) {
        self.init(stringWithSizesDividedByX: stringWithSizesDividedByX)
        self.title = title
    }
    
    var name: String {
        guard let name = self.title else {
            return "Noname"
        }
        return name
    }
    
    var description: String {
        return "Box: [name:\(self.name), width:\(self.width), depth: \(self.depth), height: \(self.height)]"
    }
        
    static func ==(box1: Box, box2: Box) -> Bool {
        return box1.isEqual(box: box2)
    }
}
