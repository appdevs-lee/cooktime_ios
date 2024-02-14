//
//  SettingViewController.swift
//  cookNow
//
//  Created by Awesomepia on 2/6/24.
//

import UIKit
import KakaoSDKUser
import NaverThirdPartyLogin

final class SettingViewController: UIViewController {
    
    lazy var logoutView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var logoutLabel: UILabel = {
        let label = UILabel()
        label.text = "로그아웃"
        label.textColor = .useRGB(red: 61, green: 61, blue: 61)
        label.font = .useFont(ofSize: 16, weight: .Medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(logoutButton(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let naverLoginInstance = NaverThirdPartyLoginConnection.getSharedInstance()
    
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
    
    //    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    //        return .portrait
    //    }
    
    deinit {
        print("----------------------------------- SettingViewController is disposed -----------------------------------")
    }
}

// MARK: Extension for essential methods
extension SettingViewController: EssentialViewMethods {
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
            self.logoutView,
            self.logoutLabel,
            self.logoutButton
        ], to: self.view)
    }
    
    func setLayouts() {
        let safeArea = self.view.safeAreaLayoutGuide
        
        // logoutView
        NSLayoutConstraint.activate([
            self.logoutView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            self.logoutView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            self.logoutView.heightAnchor.constraint(equalToConstant: 52),
            self.logoutView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20)
        ])
        
        // logoutLabel
        NSLayoutConstraint.activate([
            self.logoutLabel.leadingAnchor.constraint(equalTo: self.logoutView.leadingAnchor, constant: 20),
            self.logoutLabel.centerYAnchor.constraint(equalTo: self.logoutView.centerYAnchor),
        ])
        
        // logoutButton
        NSLayoutConstraint.activate([
            self.logoutButton.leadingAnchor.constraint(equalTo: self.logoutView.leadingAnchor),
            self.logoutButton.trailingAnchor.constraint(equalTo: self.logoutView.trailingAnchor),
            self.logoutButton.topAnchor.constraint(equalTo: self.logoutView.topAnchor),
            self.logoutButton.bottomAnchor.constraint(equalTo: self.logoutView.bottomAnchor)
        ])
        
        
    }
    
    func setViewAfterTransition() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func setUpNavigationItem() {
        self.view.backgroundColor = .useRGB(red: 255, green: 247, blue: 230)
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .clear // Navigation bar is transparent and root view appears on it.
        appearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor:UIColor.useRGB(red: 66, green: 66, blue: 66),
            .font:UIFont.useFont(ofSize: 20, weight: .Bold)
        ]
        
        // MARK: NavigationItem appearance for each view controller
        self.navigationItem.scrollEdgeAppearance = appearance
        self.navigationItem.standardAppearance = appearance
        self.navigationItem.compactAppearance = appearance
        
        self.navigationItem.title = "환경설정"
    }
}

// MARK: - Extension for methods added
extension SettingViewController {
    func logout() {
        print(ReferenceValues.firstVC?.presentedViewController)
        
        guard ReferenceValues.firstVC?.presentedViewController is TabBarController else {
            SupportingMethods.shared.turnCoverView(.off)
            return
        }
        
        ReferenceValues.firstVC?.dismiss(animated: true) {
            SupportingMethods.shared.turnCoverView(.off)
            ReferenceValues.firstVC?.replaySplashAnimation()
            
        }
        ReferenceValues.firstVC?.navigationController?.popToRootViewController(animated: false)
        
    }
}

// MARK: - Extension for selector methods
extension SettingViewController {
    @objc func logoutButton(_ sender: UIButton) {
//        SupportingMethods.shared.turnCoverView(.on)
        switch ReferenceValues.loginWay {
        case .kakao:
            UserApi.shared.logout{(error) in
                if let error = error {
                    print(error)
                    SupportingMethods.shared.turnCoverView(.off)
                    
                } else {
                    print("kakao logout success")
                    ReferenceValues.loginWay = .none
                    self.logout()
                    
                    SupportingMethods.shared.turnCoverView(.off)
                    
                }
            }
            
        case .naver:
            self.naverLoginInstance?.requestDeleteToken()
            ReferenceValues.loginWay = .none
            self.logout()
            
            SupportingMethods.shared.turnCoverView(.off)
            
        case .apple:
            ReferenceValues.loginWay = .none
            self.logout()
            
            SupportingMethods.shared.turnCoverView(.off)
            
        case .none:
            SupportingMethods.shared.turnCoverView(.off)
            
        }
    }
}

