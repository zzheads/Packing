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
    Box(stringWithSizesDividedByX: "20x10x30")!
]

print("Unique types of boxes: \(boxes.numberUniqueBoxes)")
