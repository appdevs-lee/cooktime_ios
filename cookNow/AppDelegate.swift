//
//  AppDelegate.swift
//  cookNow
//
//  Created by 이주성 on 1/15/24.
//

import UIKit
import KakaoSDKCommon
import AuthenticationServices
import NaverThirdPartyLogin

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.setApple()
        self.setKakao()
        self.setNaver()
        
        return true
    }
    
    private func setApple() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let userIdentifier = UserDefaults.standard.string(forKey: "appleUserId")
        
        appleIDProvider.getCredentialState(forUserID: userIdentifier ?? "") { (credentialState, error) in
            switch credentialState {
            case .authorized:
                // The Apple ID credential is valid.
                print("해당 ID는 연동되어있습니다.")
            case .revoked:
                // The Apple ID credential is either revoked or was not found, so show the sign-in UI.
                print("해당 ID는 연동되어있지않습니다.")
                
            case .notFound:
                // The Apple ID credential is either was not found, so show the sign-in UI.
                print("해당 ID를 찾을 수 없습니다.")
            default:
                break
            }
        }
        
        // Apple Id 사용 중단 했을 경우
        NotificationCenter.default.addObserver(forName: ASAuthorizationAppleIDProvider.credentialRevokedNotification, object: nil, queue: nil) { (Notification) in
            print("Revoked Notification")
        }
        
    }
    
    private func setKakao() {
        KakaoSDK.initSDK(appKey: ReferenceValues.kakaoAppKey)
    }
    
    private func setNaver() {
        NaverThirdPartyLoginConnection.getSharedInstance().isInAppOauthEnable = true
        NaverThirdPartyLoginConnection.getSharedInstance().isNaverAppOauthEnable = true

        let instance = NaverThirdPartyLoginConnection.getSharedInstance()
        instance?.isNaverAppOauthEnable = true
        instance?.isInAppOauthEnable = true

        instance?.serviceUrlScheme = kServiceAppUrlScheme
        instance?.consumerKey = kConsumerKey
        instance?.consumerSecret = kConsumerSecret
        instance?.appName = kServiceAppName
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

