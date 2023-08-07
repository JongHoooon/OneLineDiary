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

// 1. UITextViewDelegate
// 2. contentsTextView.delegate = self
// 3. 필요한 메서드 호출해서 구현

final class AddViewController: UIViewController, UITextViewDelegate {
    
    var type: TransitionType = .add
    var textViewContents: String = ""
    
    // placeholer
    let placeholderText = "내용을 입력해주세요."
    
    @IBOutlet weak var contentsTextView: UITextView!
    
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
            
            contentsTextView.text = textViewContents
            
            contentsTextView.text = placeholderText
            contentsTextView.textColor = .lightGray
            
        case .edit:
            contentsTextView.text = textViewContents
        }
        title = type.rawValue
        
        setBackgroundColor()
        
        contentsTextView.delegate = self

    }
    
    @objc
    func closeButtonTapped() {
        
        // present - dismiss
        dismiss(animated: true)
        
        // push - pop
//        navigationController?.popViewController(animated: true)
    }
    
    
    // 편집이 시작될 때(커서가 시작될 때)
    // 플레이스 홀더와 텍스트뷰 글자가 같다면 clear, color
    func textViewDidBeginEditing(_ textView: UITextView) {
//        if textView.text == placeholderText {
        if textView.textColor == .lightGray { 
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    // 편집이 끝날 때 (커서가 없어지는 순간)
    // 사용자가 아무 글자도 안썻으면 플레이스 홀더 보이게 설정!
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = placeholderText
            textView.textColor = .lightGray
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        print(textView.text.count)
        title = "\(textView.text.count) 글자"
    }
    
}
