//
//  MemoTableViewController.swift
//  Week3
//
//  Created by 심민규 on 2021/10/17.
//

import UIKit

class MemoTableViewController: UITableViewController {

    var list: [String] = ["장 보기", "메모메모", "영화 보러 가기", "WWDC 시청하기"]
    
    @IBOutlet weak var memoTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    
    }
    
    @IBAction func saveButtonClicked(_ sender: UIButton) {
        //배열에 텍스트뷰의 텍스트 값 추가
        if let text = memoTextView.text {
        
            list.append(text)
            
            print(list)
            
            tableView.reloadData()
            
        } else {
            print("추가할 수 없습니다.")
        }
    }
    
    //옵션 섹션 수
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    //옵션 헤더 타이틀
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "섹션 타이틀"
    }
    
    
    //1. 셀의 갯수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        if section == 0 {
//            return 2
//        } else {
//            return 4
//        }
        return section == 0 ? 2 : list.count
    }

    //2. 셀의 디자인 및 데이터 처리
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        
        //Early Exit
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "memoCell") else {
            return UITableViewCell()
        }
        
        if indexPath.section == 0 {
            cell.textLabel?.text = "첫번째 섹션입니다 - \(indexPath)"
            cell.textLabel?.textColor = .brown
            cell.textLabel?.font = .boldSystemFont(ofSize: 15)
        } else {
            
//            if indexPath.row == 0 {
//                cell?.textLabel?.text = list[indexPath.row]
//            } else if indexPath.row == indexPath.row {
//                cell?.textLabel?.text = list[indexPath.row]
//            } else if indexPath.row == indexPath.row {
//                cell?.textLabel?.text = list[indexPath.row]
//            } else if indexPath.row == indexPath.row {
//                cell?.textLabel?.text = list[indexPath.row]
//            } else {
//                cell?.textLabel?.text = "데이터 없음"
//            }
            cell.textLabel?.text = list[indexPath.row]
            cell.textLabel?.textColor = .blue
            cell.textLabel?.font = .italicSystemFont(ofSize: 13)
        }
        
        return cell
        
    }


    
    //3. 셀의 높이
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return indexPath.section == 0 ? 44 : 80
        return indexPath.row == 0 ? 44 : 80
        }
    
    //옵션 셀 편집 상태
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if indexPath.section == 1 {
            if editingStyle == .delete {
            list.remove(at: indexPath.row)
            tableView.reloadData()
            }
        }
    }
}
