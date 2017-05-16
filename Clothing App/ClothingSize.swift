//
//  ClothingSize.swift
//  Clothing App
//
//  Created by Christopher Knauth on 5/15/17.
//  Copyright © 2017 Christopher Knauth. All rights reserved.
//

import Foundation

class ClothingSize {
    var name: String
    var chestSize: Double?
    var waistSize: Double
    
    init(name:String, chestSize: Double?, waistSize: Double){
    self.name = name
    self.chestSize = chestSize
    self.waistSize = waistSize
    }
}
