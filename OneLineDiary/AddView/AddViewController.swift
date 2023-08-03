//
//  AddViewController.swift
//  OneLineDiary
//
//  Created by JongHoon on 2023/07/31.
//

import UIKit

final class AddViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
        
        title = "추가 화면"
        
        let xmark = UIImage(systemName: "xmark")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: xmark,
            style: .plain,
            target: self,
            action: #selector(closeButtonTapped)
        )
        navigationItem.leftBarButtonItem?.tintColor = .label
    }
    
    @objc
    func closeButtonTapped() {
        
        // present - dismiss
        dismiss(animated: true)
        
        // push - pop
//        navigationController?.popViewController(animated: true)
    }
}
