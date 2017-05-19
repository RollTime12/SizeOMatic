//
//  ClothingSize.swift
//  Clothing App
//
//  Created by Christopher Knauth on 5/15/17.
//  Copyright © 2017 Christopher Knauth. All rights reserved.
//

import Foundation

public class ClothingSize {
    public var name: String
    public var chestSize: Double?
    public var waistSize: Double

    public init(name:String, chestSize: Double?, waistSize: Double){
        self.name = name
        self.chestSize = chestSize
        self.waistSize = waistSize
    }
}
