//
//  ExtensionsUIText.swift
//  HitNumber
//
//  Created by Douglas  Rodrigues  on 16/02/23.
//

import UIKit

extension UITextField {
    
    static let textFieldUI = UITextField()
    
    func textUI(text: String) -> UITextField {
        let field = UITextField()
        field.placeholder = text
        field.textContentType = .username
        field.textColor = .white
        field.keyboardType = .numberPad
        field.layer.borderWidth = 1.0
        field.layer.cornerRadius = 5
        field.layer.borderColor = UIColor.white.cgColor
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: field.frame.height))
        field.leftViewMode = .always
        return field
    }
}
