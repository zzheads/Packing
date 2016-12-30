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
    Box(stringWithSizesDividedByX: "20x10x30")!,
    Box(stringWithSizesDividedByX: "20x40x30")!,
    Box(stringWithSizesDividedByX: "20x10x30")!,
    Box(stringWithSizesDividedByX: "20x10x30")!,
    Box(stringWithSizesDividedByX: "20x10x30")!,
    Box(stringWithSizesDividedByX: "40x30x30")!,
    Box(stringWithSizesDividedByX: "10x40x30")!,
]

let box = boxes.widestSurfaceBox!
print("Widest surface box: \(box) and widest surface is: square - \(box.widestSurface.square), surface - \(box.widestSurface.surface.rawValue)")
