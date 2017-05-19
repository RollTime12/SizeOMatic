//
//  ViewController.swift
//  Clothing App
//
//  Created by Christopher Knauth on 5/15/17.
//  Copyright © 2017 Christopher Knauth. All rights reserved.
//

import UIKit
import SizeOMaticKit

class ViewController: UIViewController {

    @IBOutlet weak var keywordTextField: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var chestTextField: UITextField!
    @IBOutlet weak var waistTextField: UITextField!
    @IBOutlet weak var sizeLabel: UILabel!
    var selectedClothingType: SizeOMaticKit.ClothingType {
        let index = pickerView.selectedRow(inComponent:0)
        return ClothingType.allValues[index]
    }
    let apiManager = APIManager()

    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        let size = SizeManager.shared.calculateClothingSize(clothingType: selectedClothingType, chestInches: chestTextField.text ?? "", waistInches: waistTextField.text ?? "")
        sizeLabel.text = size
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? WebViewController {
            vc.urlRequest = apiManager.urlRequest(with:selectedClothingType.rawValue, keywordTextField.text ?? "", sizeLabel.text ?? "")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}
extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ClothingType.allValues.count
    }
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ClothingType.allValues[row].rawValue
    }
}
