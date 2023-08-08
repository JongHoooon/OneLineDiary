//
//  LottoViewController.swift
//  OneLineDiary
//
//  Created by JongHoon on 2023/08/03.
//

import UIKit

import Alamofire
import SwiftyJSON

final class LottoViewController: UIViewController,
                           UIPickerViewDelegate,
                           UIPickerViewDataSource {
    
    private var list: [Int] = Array(1...1079).reversed()
    
    @IBOutlet weak private var numberTextField: UITextField!
    private let pickerView = UIPickerView()
    
    
    @IBOutlet weak private var drwtNumberLabel: UILabel!
    @IBOutlet weak private var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        numberTextField.inputView = pickerView
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        numberTextField.tintColor = .clear
        
    }
    
    private func callRequest(drwNo: Int) {
        
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(drwNo)"
        
        AF.request(
            url,
            method: .get
        )
        .validate()
        .responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                
                let date = json["drwNoDate"].stringValue
                var drwtNums: [String] = []
                for i in 1...6 {
                    drwtNums.append(String(json["drwtNo\(i)"].intValue))
                }
                drwtNums.append(String(json["bnusNo"].intValue))
                
                self.drwtNumberLabel.text = drwtNums.joined(separator: " ")
                self.dateLabel.text = "\(date)"
                
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension LottoViewController {
    
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
        numberTextField.text = "\(list[row])"
        
        let drwNo = Int(list[row])
        callRequest(drwNo: drwNo)
    }
    
    func pickerView(
        _ pickerView: UIPickerView,
        titleForRow row: Int,
        forComponent component: Int
    ) -> String? {
        return "\(list[row])"
    }
    
}
