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
    
    let clothingType = ["Shirts","Pants"]
    var selectedClothingType: String{
        let index = pickerView.selectedRow(inComponent:0)
    return clothingType[index]
    }
    var pantsSizes: [ClothingSize] = []
    var shirtsSizes: [ClothingSize] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        createPantSizes()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func createPantSizes(){
        pantsSizes.append(ClothingSize(name:"small", chestSize:nil,waistSize:29))
       pantsSizes.append(ClothingSize(name:"medium", chestSize:nil,waistSize:33))
        pantsSizes.append(ClothingSize(name:"large", chestSize:nil,waistSize:37))
        }
    func createShirtSizes(){
        shirtsSizes.append(ClothingSize(name:"small", chestSize:37.75,waistSize:30))
        shirtsSizes.append(ClothingSize(name:"medium", chestSize:39.75,waistSize:32))
        shirtsSizes.append(ClothingSize(name:"large", chestSize:41.75,waistSize:34))
    }



}
extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }
    
}
extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return clothingType[row]
    }
}
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
   return true
    }
}
