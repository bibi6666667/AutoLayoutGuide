//
//  ViewController.swift
//  AutoLayoutPractice
//
//  Created by Bibi on 2023/01/07.
//

import UIKit

class ViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // 화면 전환 시 넣고 싶은 설정 지정
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPopup" {
            let floatingVC = segue.destination as! FloatingButtonListViewController
            floatingVC.modalPresentationStyle = .overFullScreen
        }
    }
}

