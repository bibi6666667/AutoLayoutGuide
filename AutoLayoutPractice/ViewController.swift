//
//  ViewController.swift
//  AutoLayoutPractice
//
//  Created by Bibi on 2023/01/07.
//

import UIKit

class ViewController: UIViewController, CustomKeyboardDelegate {
    
    @IBOutlet weak var firstTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1. xib파일 전체 불러오기 (Array형태)
        let loadNib = Bundle.main.loadNibNamed("CustomKeyboard", owner: nil)
        
        // 2. xib파일의 첫 번째 뷰 불러오기 (인덱스 활용)
        let myKeyboardView = loadNib?.first as! CustomKeyboard
        
        // 3. xib로부터 불러온 뷰를 UITextField의 뷰로 지정
        firstTextField.inputView = myKeyboardView
        
        myKeyboardView.delegate = self
    }
    
    func keyboardTapped(str: String) {
        let oldNumber = Int(firstTextField.text!)
        var newNumber = Int(str)
        
        if str == "00" && oldNumber != nil {
            newNumber = oldNumber! * 100
        }
        
        if str == "000" && oldNumber != nil {
            newNumber = oldNumber! * 1000
        }
        
        if let hasNumber = newNumber {
            
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            
            // 포맷에 맞는 결과값이 나옴
            if let formattedNumber = numberFormatter.string(from: NSNumber(value: hasNumber)) {
                
                firstTextField.text = String(describing: formattedNumber)
            }
        }
    }
}

