//
//  SizeManager.swift
//  Clothing App
//
//  Created by Christopher Knauth on 5/19/17.
//  Copyright © 2017 Christopher Knauth. All rights reserved.
//

import Foundation

public class SizeManager{

    var pantsSizes: [ClothingSize] = []
    var shirtsSizes: [ClothingSize] = []


    public static var shared = SizeManager()
    private init(){
        createPantSizes()
        createShirtSizes()
    }

    func createPantSizes() {
        pantsSizes.append(ClothingSize(name:"Extra Small", chestSize:nil,waistSize:27.5))
        pantsSizes.append(ClothingSize(name:"Small", chestSize:nil,waistSize:29))
        pantsSizes.append(ClothingSize(name:"Medium", chestSize:nil,waistSize:33))
        pantsSizes.append(ClothingSize(name:"Large", chestSize:nil,waistSize:37))
        pantsSizes.append(ClothingSize(name:"Extra Large", chestSize:nil,waistSize:41))
        pantsSizes.append(ClothingSize(name:"Double Extra Large", chestSize:nil,waistSize:45))
        pantsSizes.append(ClothingSize(name:"Triple Extra Large", chestSize:nil,waistSize:49))
        pantsSizes.append(ClothingSize(name:"Quadruple Extra Large", chestSize:nil,waistSize:53))
        pantsSizes.append(ClothingSize(name:"Quintuple Extra Large", chestSize:nil,waistSize:57))
        pantsSizes.append(ClothingSize(name:"Sextuple Extra Large", chestSize:nil,waistSize:61))
    }

    func createShirtSizes() {
        shirtsSizes.append(ClothingSize(name:"Extra Small", chestSize:35.75,waistSize:28))
        shirtsSizes.append(ClothingSize(name:"Small", chestSize:37.75,waistSize:30))
        shirtsSizes.append(ClothingSize(name:"Medium", chestSize:39.75,waistSize:32))
        shirtsSizes.append(ClothingSize(name:"Large", chestSize:41.75,waistSize:34))
        shirtsSizes.append(ClothingSize(name:"Extra Large", chestSize:44.75,waistSize:37))
        shirtsSizes.append(ClothingSize(name:"Double Extra Large", chestSize:46.75,waistSize:39))
    }

    public func calculateClothingSize(clothingType:ClothingType,chestInches:String,waistInches:String) -> String? {


        guard let waistSize = Double(waistInches), let chestSize = Double(chestInches) else {
            return nil
        }

        if clothingType == .pants && waistSize > 61 {
            return "Input too large"
        }

        else if clothingType == .shirts && waistSize > 39 {
            return "Input too large"
        }


        guard chestSize <= 46.75 else{
            return "Input too large"
        }

        if clothingType == .shirts {
            return shirtsSizes.filter({$0.waistSize >= waistSize}).filter({$0.chestSize ?? 0 >= chestSize}).first?.name

        } else if clothingType == .pants {
            return pantsSizes.filter({$0.waistSize >= waistSize}).first?.name
        }
        
        return nil
    }
}
