//
//  DiaryTableViewController.swift
//  OneLineDiary
//
//  Created by JongHoon on 2023/07/31.
//

import UIKit

final class DiaryTableViewController: UITableViewController {

    var list = [
        "test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1test1",
        "test2test2test2test2test2test2test2test2test2test2test2test2test2test2test2test2test2test2test2test2test2test2test2test2test2test2test2test2test2test2test2test2",
        "test3test3test3test3test3test3test3test3test3test3test3test3test3test3test3test3test3test3test3test3test3test3test3test3test3test3test3test3test3test3test3test3test3test3test3test3test3test3test3test3test3test3test3test3test3test3test3test3test3test3test3"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
//        tableView.backgroundColor = .clear
        
        // xib로 테이블뷰셀을 생성할 경우, 테이블뷰에 사용할 셀을 등록해주는 과정이 필요
        let nib = UINib(
            nibName: DiaryTableViewCell.identifier,
            bundle: nil
        )
        tableView.register(
            nib,
            forCellReuseIdentifier: DiaryTableViewCell.identifier
        )
        
        // Dynamic Height
        //   1. automaticDimension
        //   2. label numberOfLines
        //   3. AutoLayout(여백)
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    @IBAction func addBarButtonItemTapped(_ sender: UIBarButtonItem) {
        
        
        
        // 1. 스토리보드 파일 찾기
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        // 2. 스토리보드 파일 내 뷰컨트롤러 찾기
        // let vc = sb.instantiateViewController(withIdentifier: "AddViewController") as! AddViewController
        
        // 자기가 속한 storyboard 알고있음, 같은 스토리 보드에 있다면 sb를 사용하지 않아도 접근할 수 있다.
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddViewController") as! AddViewController
        
        // 2-1(옵션) 네비게이션 컨트롤러가 있는 형태(제목바)로 Present 하고 싶은 경우
        // nav를 사용한다면, present와 화면 전환 방식도 nav로 수정 해주어야 함!!
        let nav = UINavigationController(rootViewController: vc)
        
        // 3. 화면 전환 방식 설정
        nav.modalTransitionStyle = .coverVertical
        nav.modalPresentationStyle = .fullScreen
        
        // 4. 화면 띄우기
        present(nav, animated: true) // modal
    }
    
    @IBAction func searchBarButtonItemTapped(_ sender: UIBarButtonItem) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SearchCollectionViewController") as! SearchCollectionViewController
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension DiaryTableViewController {
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        
        return list.count
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DiaryTableViewCell.identifier) as? DiaryTableViewCell else { return UITableViewCell() }
        
        cell.contentLabel.numberOfLines = 0
        cell.contentLabel.text = list[indexPath.row]
        cell.backgroundColor = .clear
        
        return cell
    }
    
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.contents = list[indexPath.row]
        
        // contentsLabel이 contents보다 늦게 생성돼서 nil 값이라 error 발생한다.
//        vc.contentsLabel.text = list[indexPath.row]
        
        // 인터페이스 빌더에 네비게이션 컨트롤러가 임베드 되어야만 Push가 동작한다.
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // 1. system 호출
    override func tableView(
        _ tableView: UITableView,
        canEditRowAt indexPath: IndexPath
    ) -> Bool {
        
        return true
    }
    
    // 2. custom
    override func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        list.remove(at: indexPath.row)
        tableView.reloadData()  // 데이터가 바뀌면 뷰에 맞춰줘야 한다.
    }
    
    /*
    override func tableView(
        _ tableView: UITableView,
        leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath
    ) -> UISwipeActionsConfiguration? {
        
        UIContextualAction(
            style: <#T##UIContextualAction.Style#>,
            title: <#T##String?#>,
            handler: <#T##UIContextualAction.Handler##UIContextualAction.Handler##(UIContextualAction, UIView, @escaping (Bool) -> Void) -> Void#>
        )
        
        return UISwipeActionsConfiguration(actions: [])
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        return UISwipeActionsConfiguration(actions: [])
    }
     */
}

/*
 - system
 
 - custom
 
   1. leading
   2. trailing
 */
