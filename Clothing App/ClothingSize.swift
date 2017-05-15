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
    var chestSize: Int?
    var waistSize: Int
    
    init(name:String, chestSize: Int?, waistSize: Int){
    self.name = name
    self.chestSize = chestSize
    self.waistSize = waistSize
    }
}
