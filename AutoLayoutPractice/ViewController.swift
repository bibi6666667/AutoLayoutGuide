//
//  ViewController.swift
//  AutoLayoutPractice
//
//  Created by Bibi on 2023/01/07.
//

import UIKit

class ExpandCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    struct ExpandDataModel {
        var description: String
        var isExpand: Bool
    }
    
    var dataModels = [ExpandDataModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textArray = ["short text",
                         "longlonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglong text",
                         "short text",
                         "longlonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglong text",
                         "short text",
                         "longlonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglonglong text"]
        
        // 위 텍스트를 데이터 모델에 넣어야 함
        for (_, value) in textArray.enumerated() {
            // 셀의 기본값은 확장되어 있지 않음(false)
            dataModels.append(ExpandDataModel.init(description: value, isExpand: false))
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "expandCell_ID", for: indexPath) as! ExpandCell
        cell.descriptionLabel.text = dataModels[indexPath.row].description
        
        if dataModels[indexPath.row].isExpand == true {
            // 확장했을 때는 텍스트 길이만큼 늘어나도록 함
            cell.descriptionLabel.numberOfLines = 0
        } else {
            // 확장하지 않았을 때는 기본 길이만 보여줌 (1줄)
            cell.descriptionLabel.numberOfLines = 1
        }
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataModels[indexPath.row].isExpand = !dataModels[indexPath.row].isExpand
        
        UIView.setAnimationsEnabled(false)
        tableView.reloadRows(at: [indexPath], with: .none)
        UIView.setAnimationsEnabled(true) // reload 후에는 다시 true로 바꿔 주어야 한다.
    }
}

