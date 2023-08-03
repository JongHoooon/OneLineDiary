//
//  SearchCollectionViewController.swift
//  OneLineDiary
//
//  Created by JongHoon on 2023/07/31.
//

import UIKit

final class SearchCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(
            nibName: "SearchCollectionViewCell",
            bundle: nil
        )
        collectionView.register(
            nib,
            forCellWithReuseIdentifier: "SearchCollectionViewCell"
        )
        
        setCollectionViewLayout()
    }
    
    private func setCollectionViewLayout() {
        // cell estimated size none 으로 인터페이스 빌더에서 설정할 것!
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 20.0
        let width = (UIScreen.main.bounds.width - spacing * 4.0) / 3.0
        
        layout.itemSize = CGSize(
            width: width,
            height: width
        )
        layout.sectionInset = UIEdgeInsets(
            top: spacing,
            left: spacing,
            bottom: spacing,
            right: spacing
        )
        layout.minimumInteritemSpacing = spacing
        layout.minimumLineSpacing = spacing
        
        collectionView.collectionViewLayout = layout
    }
    
    // 1. cell 갯수
    override func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return 100
    }
    
    // 2.
    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "SearchCollectionViewCell",
            for: indexPath
        ) as! SearchCollectionViewCell
    
        cell.backgroundColor = .brown
        cell.contentsLabel.text = "\(indexPath)"
        
        return cell
    }
    
}
