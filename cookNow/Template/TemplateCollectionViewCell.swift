//
//  TemplateCollectionViewCell.swift
//  RPATest
//
//  Created by 이주성 on 2023/09/02.
//

import UIKit

final class TemplateCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setViewFoundation()
        self.initializeObjects()
        self.setSubviews()
        self.setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extension for essential methods
extension TemplateCollectionViewCell: EssentialCellHeaderMethods {
    func setViewFoundation() {
        self.backgroundColor = .white
    }
    
    func initializeObjects() {
        
    }
    
    func setSubviews() {
        
    }
    
    func setLayouts() {
        //let safeArea = self.safeAreaLayoutGuide
        
        //
        NSLayoutConstraint.activate([
            
        ])
    }
}

// MARK: - Extension for methods added
extension TemplateCollectionViewCell {
    func setCell() {
       
    }
}
