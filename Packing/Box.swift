//
//  Box.swift
//  Packing
//
//  Created by Alexey Papin on 29.12.16.
//  Copyright © 2016 zzheads. All rights reserved.
//

import Foundation

enum Direction {
    case Vertical
    case Horizontal
    case Center
}

protocol BoxType {
    var width: Double { get set }
    var depth: Double { get set }
    var height: Double { get set }

    init(width: Double, depth: Double, height: Double)
    convenience init?(stringWithSizesDividedByX: String)
    
    var volume: Double { get }
    var logestEdge: Double { get }
    var widestSurface: Double { get }
    
    func rotate(inDirection direction: Direction)
}

extension BoxType {
    init(width: Double, depth: Double, height: Double) {
        self.width = width
        self.depth = depth
        self.height = height
    }
    
    convenience init?(stringWithSizesDividedByX: String) {
        let sizes = stringWithSizesDividedByX.localizedUppercase.characters.split(separator: "X").map(String.init).map({Double($0.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines))})
        if (sizes.count != 3) {
            return nil
        }
        guard let width = sizes[0], let depth = sizes[1], let height = sizes[2] else {
            return nil
        }
        self.init(width: width, depth: depth, height: height)
    }

    var volume: Double {
        return (self.width * self.depth * self.height)
    }
    
    var longestEdge: Double {
        return [self.depth, self.width, self.height].max()
    }
    
    var widestSurface: Double {
        return [self.depth * self.width, self.depth * self.height, self.width * self.height].max()
    }
    
    func rotate(inDirection direction: Direction) {
        var temp: Double
        switch (direction) {
        case .Vertical:
            temp = self.depth
            self.depth = self.height
            self.height = temp
        case .Horizontal:
            temp = self.depth
            self.depth = self.width
            self.width = temp
        case .Center:
            temp = self.width
            self.width = self.height
            self.height = temp
        }
    }
}

class Box: BoxType {
    let title: String
    var width: Double
    var depth: Double
    var height: Double
    
    init(title: String, width: Double, depth: Double, height: Double) {
        self.title = title
        self.init(width: width, depth: depth, height: height)
    }
    
    convenience init?(title: String, stringWithSizesDividedByX: String) {
        self.title = title
        self.init(stringWithSizesDividedByX: stringWithSizesDividedByX)
    }
}
