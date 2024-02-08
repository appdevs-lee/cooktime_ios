//
//  TabBarController.swift
//  cookNow
//
//  Created by 이주성 on 1/15/24.
//

import UIKit

class TabBarController: UITabBarController {
    
    var previousSelectedIndex: Int = 0
    var currentSelectedIndex: Int = 0 {
        didSet {
            self.previousSelectedIndex = oldValue
        }
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        self.modalPresentationStyle = .fullScreen
        self.modalTransitionStyle = .crossDissolve
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ingredientsVC = IngredientsViewController()
        let RefrigeratorVC = RefrigeratorViewController()
        let settingVC = SettingViewController()
        
        self.viewControllers = [
            self.createTabBarItem(tabBarTitle: "냉장고", tabBarImage: "Refrigerator", selectedImage: "SelectedRefrigeratorIcon", viewController: RefrigeratorVC),
            self.createTabBarItem(tabBarTitle: "재료함", tabBarImage: "Ingredients", selectedImage: "SelectedIngredientsIcon", viewController: ingredientsVC),
            self.createTabBarItem(tabBarTitle: "환경설정", tabBarImage: "Setting", selectedImage: "SelectedSettingIcon", viewController: settingVC),
        ]
        
        self.setUpTabBar(tabBar: self.tabBar)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return self.selectedViewController?.preferredStatusBarStyle ?? .default
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return (self.selectedViewController?.supportedInterfaceOrientations ?? .portrait) == .landscape ? .landscape : .portrait
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return (self.selectedViewController?.preferredInterfaceOrientationForPresentation ?? .portrait) == .landscapeRight ? .landscapeRight : .portrait
    }
    
    func setUpTabBar(tabBar: UITabBar) {
        tabBar.backgroundColor = .white
        tabBar.tintColor = .useRGB(red: 28, green: 157, blue: 46)
        
        let appearance = UITabBarItem.appearance()
        
        let attributes = [NSAttributedString.Key.font: UIFont.useFont(ofSize: 12, weight: .Medium)]
        appearance.setTitleTextAttributes(attributes, for: .normal)
        
    }
    
    deinit {
            print("----------------------------------- TabBarController disposed -----------------------------------")
    }

}



// MARK: - Extension for methods added
extension TabBarController {
    func createTabBarItem(tabBarTitle: String, tabBarImage: String, selectedImage: String, viewController: UIViewController) -> UINavigationController {
        let naviVC = CustomizedNavigationController(rootViewController: viewController)
        naviVC.tabBarItem.title = tabBarTitle
        naviVC.tabBarItem.selectedImage = UIImage(named: selectedImage)?.withRenderingMode(.alwaysOriginal)
        naviVC.tabBarItem.image = UIImage(named: tabBarImage)?.withRenderingMode(.alwaysOriginal)
        
        return naviVC
    }
}

// MARK: - Extension for UITabBarControllerDelegate
extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        self.currentSelectedIndex = tabBarController.selectedIndex
    }
}
