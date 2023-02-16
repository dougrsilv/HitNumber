//
//  ExtensionsUILabel.swift
//  HitNumber
//
//  Created by Douglas  Rodrigues  on 16/02/23.
//

import UIKit

extension UILabel {
    
    static let textUI = UILabel()
    
    func textLabel(text: String, font: CGFloat) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: font)
        return label
    }
    
}
