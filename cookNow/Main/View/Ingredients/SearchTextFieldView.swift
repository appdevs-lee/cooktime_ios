//
//  SearchTextFieldView.swift
//  cookNow
//
//  Created by Awesomepia on 2/28/24.
//

import UIKit

class SearchTextFieldView: UIView {
    
    lazy var searchView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.useRGB(red: 223, green: 223, blue: 223).cgColor
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 6
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var searchImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "SearchIcon")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.setPlaceholder(placeholder: "재료를 입력하세요.")
        textField.borderStyle = .none
        textField.backgroundColor = .clear
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    lazy var searchCancelButton: UIButton = {
        let button = UIButton()
        button.isHidden = true
        button.setImage(UIImage(named: "xmark"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var resultView: UIView = {
        let view = UIView()
        view.isHidden = true
        view.backgroundColor = .white
        view.layer.cornerRadius = 6
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 48))
        
        self.setSubViews()
        self.setLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SearchTextFieldView {
    func setSubViews() {
        SupportingMethods.shared.addSubviews([
            self.searchView,
            self.searchImageView,
            self.searchTextField,
            self.searchCancelButton,
            self.resultView
        ], to: self)
    }
    
    func setLayouts() {
        // searchView
        NSLayoutConstraint.activate([
            self.searchView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.searchView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.searchView.topAnchor.constraint(equalTo: self.topAnchor),
            self.searchView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        // searchImageView
        NSLayoutConstraint.activate([
            self.searchImageView.leadingAnchor.constraint(equalTo: self.searchView.leadingAnchor, constant: 10),
            self.searchImageView.centerYAnchor.constraint(equalTo: self.searchView.centerYAnchor),
            self.searchImageView.heightAnchor.constraint(equalToConstant: 24),
            self.searchImageView.widthAnchor.constraint(equalToConstant: 24)
        ])
        
        // searchTextField
        NSLayoutConstraint.activate([
            self.searchTextField.leadingAnchor.constraint(equalTo: self.searchImageView.trailingAnchor, constant: 4),
            self.searchTextField.topAnchor.constraint(equalTo: self.searchImageView.topAnchor),
            self.searchTextField.bottomAnchor.constraint(equalTo: self.searchImageView.bottomAnchor),
            self.searchTextField.trailingAnchor.constraint(equalTo: self.searchCancelButton.leadingAnchor)
        ])
        
        // searchCancelButton
        NSLayoutConstraint.activate([
            self.searchCancelButton.trailingAnchor.constraint(equalTo: self.searchView.trailingAnchor, constant: -10),
            self.searchCancelButton.centerYAnchor.constraint(equalTo: self.searchView.centerYAnchor),
            self.searchCancelButton.widthAnchor.constraint(equalToConstant: 24),
            self.searchCancelButton.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        // resultView
        NSLayoutConstraint.activate([
            self.resultView.topAnchor.constraint(equalTo: self.searchView.bottomAnchor, constant: 20),
            self.resultView.leadingAnchor.constraint(equalTo: self.searchView.leadingAnchor),
            self.resultView.trailingAnchor.constraint(equalTo: self.searchView.trailingAnchor),
            self.resultView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}

// MARK: - Extension for methods added
extension SearchTextFieldView {
    func changeDesignForSearching() {
        self.searchCancelButton.isHidden = false
        self.searchView.layer.borderColor = UIColor.useRGB(red: 28, green: 157, blue: 46).cgColor
    }
    
    func changeDesignSearchDone() {
        self.searchCancelButton.isHidden = true
        self.searchView.layer.borderColor = UIColor.useRGB(red: 223, green: 223, blue: 223).cgColor
    }
}

// MARK: - Extension for selector added
extension SearchTextFieldView {
    
}
