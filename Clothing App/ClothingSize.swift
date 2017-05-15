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
    var chestSize: Float?
    var waistSize: Float
    
    init(name:String, chestSize: Float?, waistSize: Float){
    self.name = name
    self.chestSize = chestSize
    self.waistSize = waistSize
    }
}
