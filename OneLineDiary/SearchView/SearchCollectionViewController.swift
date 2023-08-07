//
//  SearchCollectionViewController.swift
//  OneLineDiary
//
//  Created by JongHoon on 2023/07/31.
//

import UIKit

final class SearchCollectionViewController: UICollectionViewController {

    var searchList: [String] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    let list = [
        "iOS", "iPad", "Android", "Apple",
        "Watch", "사과", "사자", "호랑이"
    ]
    
    let searchBar = UISearchBar()
    
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
        
        searchBar.placeholder = "검색어를 입력해주세요."
        searchBar.showsCancelButton = true
        
        navigationItem.titleView = searchBar
        
        collectionView.keyboardDismissMode = .onDrag
        
        searchBar.delegate = self
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
    
  
}

extension SearchCollectionViewController: UISearchBarDelegate {
    // 1. cell 갯수
    override func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return searchList.count
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
        cell.contentsLabel.text = searchList[indexPath.item]
        
        return cell
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("================================================")
        
        searchList.removeAll()
        
        for item in list {
            if item.contains(searchBar.text!) {
                searchList.append(item)
                print(searchList)
            }
        }
        
        searchBar.text = ""
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    func searchBar(
        _ searchBar: UISearchBar,
        textDidChange searchText: String
    ) {
        searchList.removeAll()
        
        for item in list {
            if item.contains(searchBar.text!) {
                searchList.append(item)
                print(searchList)
            }
        }
    }
}
