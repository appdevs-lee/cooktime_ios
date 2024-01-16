//
//  Extension.swift
//  Lister
//
//  Created by 이주성 on 1/10/24.
//

import Foundation
import UIKit

extension UITextField {
    func setPlaceholder(placeholder: String) {
        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [
            NSAttributedString.Key.foregroundColor: UIColor.useRGB(red: 206, green: 212, blue: 218),
            .font: UIFont.useFont(ofSize: 16, weight: .SemiBold)
        ])
    }
    
    func setBorder() {
        self.borderStyle = .none
        self.layer.borderColor = UIColor.useRGB(red: 206, green: 212, blue: 218).cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 4
        self.addLeftPadding()
    }
    
    func addLeftPadding() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        self.leftView = view
        self.leftViewMode = .always
    }
}
