//
//  FloatingButtonListViewController.swift
//  AutoLayoutPractice
//
//  Created by Bibi on 2023/03/07.
//

import UIKit

class FloatingButtonListViewController: UIViewController {

    @IBOutlet weak var button1CenterY: NSLayoutConstraint!
    
    @IBOutlet weak var button2CenterY: NSLayoutConstraint!
    
    @IBOutlet weak var button3CenterY: NSLayoutConstraint!
    
    // 뷰가 그려지기 전에는 모든 버튼들이 숨겨져 있다
    override func viewDidLoad() {
        super.viewDidLoad()

        button1CenterY.constant = 0
        button2CenterY.constant = 0
        button3CenterY.constant = 0
    }
    
    // 뷰가 나타나기 직전에는 버튼들이 움직이며 제 위치로 이동한다
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // 일반 애니메이션 효과 적용
//        UIView.animate(withDuration: 1) { [weak self] in
//            self?.button1CenterY.constant = 80
//            self?.button2CenterY.constant = 160
//            self?.button3CenterY.constant = 240
//
//            self?.view.layoutIfNeeded() // (필수) 화면 갱신 코드
//        }
        
        // 흔들리는 애니메이션 효과 적용
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: .curveEaseOut) { [weak self] in
            self?.button1CenterY.constant = 80
            self?.button2CenterY.constant = 160
            self?.button3CenterY.constant = 240
            
            self?.view.layoutIfNeeded() // (필수) 화면 갱신 코드
        }


    }

    // +버튼을 다시 클릭하면, 하위 버튼들이 접히며 이전 화면으로 돌아간다
    @IBAction func dismissFloating(_ sender: Any) {
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseOut) { [weak self] in
            self?.button1CenterY.constant = 0
            self?.button2CenterY.constant = 0
            self?.button3CenterY.constant = 0
            
            self?.view.layoutIfNeeded() // (필수) 화면 갱신 코드
        } completion: { _ in
            self.dismiss(animated: false, completion: nil) // 현재 뷰 컨트롤러를 사라지게 함
        }
    }
}
