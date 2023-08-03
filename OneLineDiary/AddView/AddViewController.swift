//
//  AddViewController.swift
//  OneLineDiary
//
//  Created by JongHoon on 2023/07/31.
//

import UIKit

enum TransitionType: String {
    case add = "추가 화면"
    case edit = "수정 화면"
}

final class AddViewController: UIViewController {
    
    var type: TransitionType = .add
    var textViewContents: String = ""
    
    @IBOutlet weak var inputTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch type {
        case .add:
            let xmark = UIImage(systemName: "xmark")
            navigationItem.leftBarButtonItem = UIBarButtonItem(
                image: xmark,
                style: .plain,
                target: self,
                action: #selector(closeButtonTapped)
            )
            navigationItem.leftBarButtonItem?.tintColor = .label
            
        case .edit:
            break
        }
        
        inputTextView.text = textViewContents
        title = type.rawValue
        
        setBackgroundColor()
    }
    
    @objc
    func closeButtonTapped() {
        
        // present - dismiss
        dismiss(animated: true)
        
        // push - pop
//        navigationController?.popViewController(animated: true)
    }
}
