//
//  IngredientsViewController.swift
//  cookNow
//
//  Created by Awesomepia on 2/8/24.
//

import UIKit

final class IngredientsViewController: UIViewController {
    
    lazy var guideLabel: UILabel = {
        let label = UILabel()
        label.text = "내 냉장고에 있는 재료들을 선택하고\n정보를 입력해보세요!"
        label.numberOfLines = 0
        label.textColor = .useRGB(red: 61, green: 61, blue: 61)
        label.font = .useFont(ofSize: 12, weight: .Medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.setPlaceholder(placeholder: "재료를 입력하세요.")
        textField.setBorder()
        textField.addLeftPadding()
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setViewFoundation()
        self.initializeObjects()
        self.setDelegates()
        self.setGestures()
        self.setNotificationCenters()
        self.setSubviews()
        self.setLayouts()
        self.setUpNavigationItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setViewAfterTransition()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    deinit {
        print("----------------------------------- IngredientsViewController is disposed -----------------------------------")
    }
}

// MARK: Extension for essential methods
extension IngredientsViewController: EssentialViewMethods {
    func setViewFoundation() {
        
    }
    
    func initializeObjects() {
        
    }
    
    func setDelegates() {
        
    }
    
    func setGestures() {
        
    }
    
    func setNotificationCenters() {
        
    }
    
    func setSubviews() {
        SupportingMethods.shared.addSubviews([
            self.guideLabel,
            self.searchTextField
        ], to: self.view)
    }
    
    func setLayouts() {
        let safeArea = self.view.safeAreaLayoutGuide
        
        // guideLabel
        NSLayoutConstraint.activate([
            self.guideLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            self.guideLabel.topAnchor.constraint(equalTo: safeArea.topAnchor)
        ])
        
        // searchTextField
        NSLayoutConstraint.activate([
            self.searchTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            self.searchTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            self.searchTextField.topAnchor.constraint(equalTo: self.guideLabel.bottomAnchor, constant: 10),
            self.searchTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func setViewAfterTransition() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func setUpNavigationItem() {
        self.view.backgroundColor = .white
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .clear // Navigation bar is transparent and root view appears on it.
        appearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor:UIColor.useRGB(red: 66, green: 66, blue: 66),
            .font:UIFont.useFont(ofSize: 18, weight: .Bold)
        ]
        
        // MARK: NavigationItem appearance for each view controller
        self.navigationItem.scrollEdgeAppearance = appearance
        self.navigationItem.standardAppearance = appearance
        self.navigationItem.compactAppearance = appearance
        
        self.navigationItem.title = "재료함"
        
    }
}

// MARK: - Extension for methods added
extension IngredientsViewController {
    
}

// MARK: - Extension for selector methods
extension IngredientsViewController {
    
}

// MARK: - Extension for UITextFieldDelegate
extension IngredientsViewController: UITextFieldDelegate {
    
}

