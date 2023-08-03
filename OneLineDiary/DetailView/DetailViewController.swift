//
//  DetailViewController.swift
//  OneLineDiary
//
//  Created by JongHoon on 2023/07/31.
//

import UIKit

final class DetailViewController: UIViewController {
    
    // Pass data 1. 데이터를 받을 공간(프로퍼티) 생성
    var contents: String = "빈 공간"
    @IBOutlet weak var contentsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
        
        // Pass data 3. 전달 받은 값을 뷰에 표현
        contentsLabel.text = contents
        contentsLabel.textColor = .label
        contentsLabel.numberOfLines = 0
    }

    @IBAction func deleteButtonTapped(_ sender: UIBarButtonItem) {
        // push - pop (nav가 존재해야한다.)
        navigationController?.popViewController(animated: true)
    }
}

/*
 변수 공간
 값전달
 뷰에 표현
 */
