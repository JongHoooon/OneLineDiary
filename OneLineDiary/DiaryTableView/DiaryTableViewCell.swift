//
//  DiaryTableViewCell.swift
//  OneLineDiary
//
//  Created by JongHoon on 2023/07/31.
//

import UIKit

class DiaryTableViewCell: UITableViewCell {
    
    static let identifier = "DiaryTableViewCell"
    
    @IBOutlet weak var diaryCellBackgroundView: UIView!
    @IBOutlet weak var contentLabel: UILabel!
}
