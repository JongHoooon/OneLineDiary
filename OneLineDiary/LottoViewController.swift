//
//  LottoViewController.swift
//  OneLineDiary
//
//  Created by JongHoon on 2023/08/03.
//

import UIKit

class LottoViewController: UIViewController,
                           UIPickerViewDelegate,
                           UIPickerViewDataSource {
    
    
//    var list = [
//        "영화", "드라마", "애니메이션",
//        "SF", "가족", "로맨스", "스릴러"
//    ]
    
//    var list = Array(repeating: "A", count: 100)
    var list: [Int] = Array(1...1100).reversed()
    
    @IBOutlet weak var numberTextField: UITextField!
    let pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberTextField.inputView = pickerView
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        numberTextField.tintColor = .clear
    }
        
    func numberOfComponents(
        in pickerView: UIPickerView
    ) -> Int {
        return 1
    }
    
    func pickerView(
        _ pickerView: UIPickerView,
        numberOfRowsInComponent component: Int
    ) -> Int {
        return list.count
    }
    
    func pickerView(
        _ pickerView: UIPickerView,
        didSelectRow row: Int,
        inComponent component: Int
    ) {
        print("selected \(row) \(component)")
        numberTextField.text = "\(list[row])"
    }
    
    func pickerView(
        _ pickerView: UIPickerView,
        titleForRow row: Int,
        forComponent component: Int
    ) -> String? {
        return "\(list[row])"
    }
}
