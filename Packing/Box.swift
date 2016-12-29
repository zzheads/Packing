//
//  Box.swift
//  Packing
//
//  Created by Alexey Papin on 29.12.16.
//  Copyright © 2016 zzheads. All rights reserved.
//

import Foundation

enum Surface {
    case Top
    case Side
    case Front
}

protocol BoxType {
    var width: Double { get set }
    var depth: Double { get set }
    var height: Double { get set }
    
    init(width: Double, depth: Double, height: Double)
    
    var volume: Double { get }
    var longestEdge: Double { get }
    var widestSurface: (surface: Surface, square: Double) { get }
    
    mutating func rotate(fromSide: Surface, toSide: Surface)
    mutating func rotateWidestSurfaceDown()
}

extension BoxType {
    init?(stringWithSizesDividedByX: String) {
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
        if (self.depth > self.width) && (self.depth > self.height) {
            return self.depth
        }
        if (self.width > self.height) {
            return self.width
        }
        return self.height
    }
    
    var widestSurface: (surface: Surface, square: Double) {
        let frontSurface = self.width * self.height
        let sideSurface = self.depth * self.height
        let topSurface = self.width * self.depth
        if (frontSurface > sideSurface) && (frontSurface > topSurface) {
            return (surface: .Front, square: frontSurface)
        }
        if (sideSurface > topSurface) {
            return (surface: .Side, square: sideSurface)
        }
        return (surface: .Top, square: topSurface)
    }
    
    mutating func rotate(fromSide: Surface, toSide: Surface) {
        var temp: Double
        let direction = (fromSide, toSide)
        switch (direction) {
        case (.Side, .Top), (.Top, .Side):
            temp = self.width
            self.width = self.height
            self.height = temp
        case (.Side, .Front), (.Front, .Side):
            temp = self.depth
            self.depth = self.width
            self.width = temp
        case (.Top, .Front), (.Front, .Top):
            temp = self.depth
            self.depth = self.height
            self.height = temp
        case (.Front, .Front), (.Top, .Top), (.Side, .Side):
            break
        }
    }
    
    // place the box on the largest surface parallel to the base of container
    mutating func rotateWidestSurfaceDown() {
        self.rotate(fromSide: self.widestSurface.surface, toSide: .Top)
    }
    
    // determine is two boxes have same sizes or not in current position
    private func isSizesEqual(box: BoxType) -> Bool {
        if (self.depth == box.depth) && (self.width == box.width) && (self.height == box.height) {
            return true
        }
    }
    
    // determine is two boxes have different sizes or not in all possible positions (3)
    func isEqual(box: BoxType) -> Bool {
        var boxToRotate: BoxType
        let allSurfaces: [Surface] = [.Top, .Side, .Front]
        for surface in allSurfaces {
            boxToRotate = box
            boxToRotate.rotate(fromSide: .Top, toSide: surface)
            if (self.isSizesEqual(box: boxToRotate)) {
                return true
            }
        }
        return false
    }
}

class Box: BoxType, CustomStringConvertible {
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
}
