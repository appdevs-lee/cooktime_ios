//
//  LoginViewController.swift
//  cookNow
//
//  Created by Awesomepia on 2/6/24.
//

import UIKit
import Gifu
import Lottie
import AuthenticationServices
import JWTDecode

final class LoginViewController: UIViewController {
    
    lazy var animationView: LottieAnimationView = {
        let view = LottieAnimationView(name: "Splash")
        view.play { completed in
            view.isHidden = true
            self.animationAfterLoginView.isHidden = false
            
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            UIView.transition(with: self.view, duration: 0.5) {
                self.changeAlphaComponent(1)
                
            }
            
        }
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var animationAfterLoginView: LottieAnimationView = {
        let view = LottieAnimationView(name: "loadingAfterLogin")
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
//    lazy var gifImageView: GIFImageView = {
//        let imageView = GIFImageView()
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        
//        imageView.animate(withGIFNamed: "SplashLottie", loopCount: 1, preparationBlock:  {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                UIView.transition(with: self.view, duration: 0.5) {
//                    self.changeAlphaComponent(1)
//                    
//                }
//                
//            }
//            
//        })
//        
//        return imageView
//    }()
    
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.isHidden = true
        imageView.image = UIImage(named: "LoginBGImage")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var mainIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.alpha = 0
        imageView.image = UIImage(named: "LoginMainIcon")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var mainTitleLabel: UILabel = {
        let label = UILabel()
        label.alpha = 0
        label.text = "쿡 나우"
        label.textColor = .useRGB(red: 61, green: 61, blue: 61)
        label.font = .useFont(ofSize: 39, weight: .Bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var snsLoginTitleLabel: UILabel = {
        let label = UILabel()
        label.alpha = 0
        label.text = "소셜 계정으로 간편 가입하기"
        label.textColor = .useRGB(red: 61, green: 61, blue: 61)
        label.font = .useFont(ofSize: 14, weight: .Medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var snsLoginButtonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.kakaoButton, self.naverButton, self.appleButton])
        stackView.alpha = 0
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
        self.view.backgroundColor = .useRGB(red: 255, green: 247, blue: 230)
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
            self.animationView,
            self.animationAfterLoginView,
            self.backgroundImageView,
            self.mainIconImageView,
            self.mainTitleLabel,
            self.snsLoginTitleLabel,
            self.snsLoginButtonStackView,
//            self.gifImageView,
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
        
        // gifImageView
//        NSLayoutConstraint.activate([
//            self.gifImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
//            self.gifImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
//            self.gifImageView.topAnchor.constraint(equalTo: self.view.topAnchor),
//            self.gifImageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
//        ])

        // animationView
        NSLayoutConstraint.activate([
            self.animationView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.animationView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.animationView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.animationView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])      
        
        // animationAfterLoginView
        NSLayoutConstraint.activate([
            self.animationAfterLoginView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.animationAfterLoginView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.animationAfterLoginView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.animationAfterLoginView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    func setViewAfterTransition() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }
}

// MARK: - Extension for methods added
extension LoginViewController {
    func changeAlphaComponent(_ alpha: CGFloat) {
        self.mainIconImageView.alpha = alpha
        self.mainTitleLabel.alpha = alpha
        self.snsLoginTitleLabel.alpha = alpha
        self.snsLoginButtonStackView.alpha = alpha
    }
}

// MARK: - Extension for selector methods
extension LoginViewController {
    @objc func kakaoButton(_ sender: UIButton) {
        self.animationAfterLoginView.play()
        
        UIView.transition(with: self.view, duration: 0.5) {
            self.changeAlphaComponent(0)
            SupportingMethods.shared.turnCoverView(.on)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                SupportingMethods.shared.turnCoverView(.off)
                
            }
        }
        
        
        
    }
    
    @objc func naverButton(_ sender: UIButton) {
        
    }
    
    @objc func appleButton(_ sender: UIButton) {
        self.animationAfterLoginView.play()
        
        UIView.transition(with: self.view, duration: 0.5) {
            self.changeAlphaComponent(0)
            SupportingMethods.shared.turnCoverView(.on)
        }
        
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
            
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
        
    }
}

// MARK: - Extension for ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding : Apple Login
extension LoginViewController: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    // Apple ID
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        // Apple ID
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            // 계정 정보 가져오기
            // Code & Token
            let identityToken = String(decoding: appleIDCredential.identityToken!, as: UTF8.self)
            UserDefaults.standard.set(identityToken, forKey: "identityToken")
            print("identityToken: \(identityToken)")
            
            let authorizationCode = String(decoding: appleIDCredential.authorizationCode!, as: UTF8.self)
            UserDefaults.standard.set(authorizationCode, forKey: "authorizationCode")
            print("authorizationCode: \(authorizationCode)")
            
            let userIdentifier = appleIDCredential.user
            UserDefaults.standard.set(userIdentifier, forKey: "appleUserId")
            print("userIdentifier: \(userIdentifier)")
            
            if let name = appleIDCredential.fullName {
                if name.description == "" {
                    UserDefaults.standard.set("", forKey: "appleUserName")
                } else {
                    if let familyName = name.familyName, let givenName = name.givenName {
                        let appleUserName = "\(familyName)\(givenName)"
                        UserDefaults.standard.set(appleUserName, forKey: "appleUserName")
                        print("koreanName: \(appleUserName)")
                    }
                    print("name: \(name)")
                }
            }
            
            
            if let userEmail = appleIDCredential.email {
                UserDefaults.standard.set(userEmail, forKey: "appleUserEmail")
            } else {
                do {
                    let jwt = try decode(jwt: identityToken)
                    if let email = jwt["email"].string {
                        UserDefaults.standard.set(email, forKey: "appleUserEmail")
                    }
                } catch {
                    print(error)
                    UserDefaults.standard.set("", forKey: "appleUserEmail")
                    SupportingMethods.shared.turnCoverView(.off)
                }
            }
            
            guard let sendUserId = UserDefaults.standard.string(forKey: "appleUserId") else {
                SupportingMethods.shared.turnCoverView(.off)
                return
            }
            guard let sendCode = UserDefaults.standard.string(forKey: "authorizationCode") else {
                SupportingMethods.shared.turnCoverView(.off)
                return
            }
            guard let sendToken = UserDefaults.standard.string(forKey: "identityToken") else {
                SupportingMethods.shared.turnCoverView(.off)
                return
            }
            guard let sendName = UserDefaults.standard.string(forKey: "appleUserName") else {
                SupportingMethods.shared.turnCoverView(.off)
                return
            }
            guard let email = UserDefaults.standard.string(forKey: "appleUserEmail") else {
                SupportingMethods.shared.turnCoverView(.off)
                return
            }
            
            print("User ID : \(sendUserId)")
            print("User Email : \(email)")
            print("User Name : \(sendName)")
            print("Token : \(String(describing: sendToken))")
            print("Code : \(String(describing: sendCode))")
            
            // FIXME: API 넣어주기
            SupportingMethods.shared.turnCoverView(.off)
            
        default:
            SupportingMethods.shared.turnCoverView(.off)
            break
        }
    }
    
    // Apple ID 연동 실패 시
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("Apple ID Error: \(error.localizedDescription)")
        SupportingMethods.shared.turnCoverView(.off)
    }
    
    // Apple 로그인을 Modal 시트로 표시
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}
