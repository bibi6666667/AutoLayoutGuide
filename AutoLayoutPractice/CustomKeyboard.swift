//
//  CustomKeyboard.swift
//  AutoLayoutPractice
//
//  Created by Bibi on 2023/03/03.
//

import UIKit

protocol CustomKeyboardDelegate {
    func keyboardTapped(str: String)
}

class CustomKeyboard: UIView {

    var delegate: CustomKeyboardDelegate?
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        delegate?.keyboardTapped(str: sender.titleLabel!.text!)
    }
    
}
