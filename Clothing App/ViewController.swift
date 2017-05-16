//
//  ViewController.swift
//  Clothing App
//
//  Created by Christopher Knauth on 5/15/17.
//  Copyright © 2017 Christopher Knauth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var keywordTextField: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var chestTextField: UITextField!
    @IBOutlet weak var waistTextField: UITextField!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        calculateClothingSize()
     
    }
    let clothingType = ["Shirts","Pants"]
    var selectedClothingType: String {
        let index = pickerView.selectedRow(inComponent:0)
        
        return clothingType[index]
    }
    var pantsSizes: [ClothingSize] = []
    var shirtsSizes: [ClothingSize] = []
    let apiManager = APIManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPantSizes()
        createShirtSizes()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
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
    
    func calculateClothingSize() -> String? {
        guard let waistSize = Double(waistTextField.text ?? ""), let chestSize = Double(chestTextField.text ?? "") else {
            
            return nil
        }
        
        if selectedClothingType == "Shirts" {
            sizeLabel.text = shirtsSizes.filter({$0.waistSize >= waistSize}).filter({$0.chestSize ?? 0 >= chestSize}).first?.name
        } else if selectedClothingType == "Pants" {
            sizeLabel.text = pantsSizes.filter({$0.waistSize >= waistSize}).first?.name
        }
        
        return nil
    }
}
extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return clothingType.count
    }
    
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return clothingType[row]
    }

}
