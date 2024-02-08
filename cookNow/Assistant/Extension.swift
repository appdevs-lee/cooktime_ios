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
            NSAttributedString.Key.foregroundColor: UIColor.useRGB(red: 139, green: 139, blue: 139),
            .font: UIFont.useFont(ofSize: 14, weight: .Medium)
        ])
    }
    
    func setBorder() {
        self.borderStyle = .none
        self.layer.borderColor = UIColor.useRGB(red: 223, green: 223, blue: 223).cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 6
        
    }
    
    func addLeftPadding() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 38, height: 40))
        button.setImage(UIImage(named: "SearchIcon"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        
        self.leftView = view
        self.leftViewMode = .always
    }
}
