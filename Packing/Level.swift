//
//  Level.swift
//  Packing
//
//  Created by Alexey Papin on 31.12.16.
//  Copyright © 2016 zzheads. All rights reserved.
//

import Foundation

class Level {
    var items: [Box] = []
    
    var width: Double {
        return 0
    }
    var depth: Double {
        return 0
    }
    var height: Double {
        return self.items.maxHeight
    }
}
