//
//  main.swift
//  Packing
//
//  Created by Alexey Papin on 29.12.16.
//  Copyright © 2016 zzheads. All rights reserved.
//

import Foundation

let boxes: [Box] = [
    Box(stringWithSizesDividedByX: "10x20x30")!,
    Box(stringWithSizesDividedByX: "20x30x40")!,
    Box(stringWithSizesDividedByX: "30x40x50")!,
]

print("Box with widest surface: \(boxes.widestSurfaceBox!)")
print("Box with first longest edge: \(boxes.firstLongestEdge!)")
print("Box with second longest edge: \(boxes.secondLongestEdge!)")

let unchanged = Box(title: "Test rotate Box", stringWithSizesDividedByX: "50.50 x 40.30 X   20.00")!
var box = unchanged
print("\(box)")
box.rotate(fromSide: .Side, toSide: .Top)
print("Rotate from Side to Top: \(box))")
box = unchanged
box.rotate(fromSide: .Side, toSide: .Front)
print("Rotate from Side to Front: \(box)")
box = unchanged
box.rotate(fromSide: .Front, toSide: .Top)
print("Rotate from Front to Top: \(box)")


