//
//  ExtensionsUIButton.swift
//  HitNumber
//
//  Created by Douglas  Rodrigues  on 16/02/23.
//

import UIKit

extension UIButton {
    
    static let buttonUI = UIButton()
    
    func buttonUI(text: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(text, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        button.layer.cornerRadius = 5
        button.addConstraint(button.heightAnchor.constraint(equalToConstant: 50))
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.isEnabled = true
        return button
    }
}
