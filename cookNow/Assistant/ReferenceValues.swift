//
//  ReferenceValues.swift
//  Lister
//
//  Created by 이주성 on 1/10/24.
//

import Foundation
import UIKit

struct ReferenceValues {
    static weak var keyWindow: UIWindow!
    // FIXME: 첫화면 만들어지면 뷰 확인하기
    static weak var firstVC: LoginViewController?
}

// MARK: - Extension of referenceValues
extension ReferenceValues {
    struct Size {
        struct Device {
            static let width: CGFloat = ReferenceValues.keyWindow.screen.bounds.width
            static let height: CGFloat = ReferenceValues.keyWindow.screen.bounds.height
        }
        
        struct SafeAreaInsets {
            static let top: CGFloat = ReferenceValues.keyWindow.safeAreaInsets.top
            static let bottom: CGFloat = ReferenceValues.keyWindow.safeAreaInsets.bottom
            static let left: CGFloat = ReferenceValues.keyWindow.safeAreaInsets.left
            static let right: CGFloat = ReferenceValues.keyWindow.safeAreaInsets.right
        }
        
        struct Ratio {
            static let bannerHeightRatio: CGFloat = 100/343
        }
    }
    
    struct Velocity {
        static let hideBottomView: CGFloat = 650
    }
    
    struct TextCount {
        struct Comment {
            static let comment: Int = 150
            static let subComment: Int = 150
        }
    }
}
