//
//  LoginViewController.swift
//  cookNow
//
//  Created by Awesomepia on 2/6/24.
//

import UIKit

final class LoginViewController: UIViewController {
    
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "LoginBGImage")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var mainIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "LoginMainIcon")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var mainTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "쿡 나우"
        label.textColor = .useRGB(red: 61, green: 61, blue: 61)
        label.font = .useFont(ofSize: 39, weight: .Bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var snsLoginTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "소셜 계정으로 간편 가입하기"
        label.textColor = .useRGB(red: 61, green: 61, blue: 61)
        label.font = .useFont(ofSize: 14, weight: .Medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var snsLoginButtonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.kakaoButton, self.naverButton, self.appleButton])
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    lazy var kakaoButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "KakaoIcon"), for: .normal)
        button.addTarget(self, action: #selector(kakaoButton(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var naverButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "NaverIcon"), for: .normal)
        button.addTarget(self, action: #selector(naverButton(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var appleButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "AppleIcon"), for: .normal)
        button.addTarget(self, action: #selector(appleButton(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setViewAfterTransition()
    }
    
    //    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    //        return .portrait
    //    }
    
    deinit {
        print("----------------------------------- LoginViewController is disposed -----------------------------------")
    }
}

// MARK: Extension for essential methods
extension LoginViewController: EssentialViewMethods {
    func setViewFoundation() {
        self.view.backgroundColor = .white
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
            self.backgroundImageView,
            self.mainIconImageView,
            self.mainTitleLabel,
            self.snsLoginTitleLabel,
            self.snsLoginButtonStackView
        ], to: self.view)
    }
    
    func setLayouts() {
        let safeArea = self.view.safeAreaLayoutGuide
        
        // backgroundImageView
        NSLayoutConstraint.activate([
            self.backgroundImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.backgroundImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.backgroundImageView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.backgroundImageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        // mainIconImageView
        NSLayoutConstraint.activate([
            self.mainIconImageView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            self.mainIconImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 224),
            self.mainIconImageView.widthAnchor.constraint(equalToConstant: 175),
            self.mainIconImageView.heightAnchor.constraint(equalToConstant: 187)
        ])
        
        // mainTitleLabel
        NSLayoutConstraint.activate([
            self.mainTitleLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            self.mainTitleLabel.topAnchor.constraint(equalTo: self.mainIconImageView.bottomAnchor, constant: 20),
            self.mainTitleLabel.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        // snsLoginTitleLabel
        NSLayoutConstraint.activate([
            self.snsLoginTitleLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            self.snsLoginTitleLabel.topAnchor.constraint(equalTo: self.mainTitleLabel.bottomAnchor, constant: 44),
            self.snsLoginTitleLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
        
        // snsLoginButtonStackView
        NSLayoutConstraint.activate([
            self.snsLoginButtonStackView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            self.snsLoginButtonStackView.topAnchor.constraint(equalTo: self.snsLoginTitleLabel.bottomAnchor, constant: 20)
        ])
        
        // kakaoButton
        NSLayoutConstraint.activate([
            self.kakaoButton.widthAnchor.constraint(equalToConstant: 54),
            self.kakaoButton.heightAnchor.constraint(equalToConstant: 54)
        ])
        
        // naverButton
        NSLayoutConstraint.activate([
            self.naverButton.widthAnchor.constraint(equalToConstant: 54),
            self.naverButton.heightAnchor.constraint(equalToConstant: 54)
        ])
        
        // appleButton
        NSLayoutConstraint.activate([
            self.appleButton.widthAnchor.constraint(equalToConstant: 54),
            self.appleButton.heightAnchor.constraint(equalToConstant: 54)
        ])
    }
    
    func setViewAfterTransition() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }
}

// MARK: - Extension for methods added
extension LoginViewController {
    
}

// MARK: - Extension for selector methods
extension LoginViewController {
    @objc func kakaoButton(_ sender: UIButton) {
        
    }
    
    @objc func naverButton(_ sender: UIButton) {
        
    }
    
    @objc func appleButton(_ sender: UIButton) {
        
    }
}

