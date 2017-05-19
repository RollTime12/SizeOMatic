//
//  ClothingType.swift
//  Clothing App
//
//  Created by Christopher Knauth on 5/19/17.
//  Copyright © 2017 Christopher Knauth. All rights reserved.
//

import Foundation

public enum ClothingType:String {
    case shirts
    case pants

    public static var allValues: [ClothingType]{
        return [.shirts,.pants]
    }

}
