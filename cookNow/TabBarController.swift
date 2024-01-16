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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUpTabBar(tabBar: tabBar)
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
        tabBar.backgroundColor = UIColor.white
        tabBar.tintColor = .useRGB(red: 151, green: 157, blue: 242)
        
        let appearance = UITabBarItem.appearance()
        let attributes = [NSAttributedString.Key.font: UIFont.useFont(ofSize: 12, weight: .Medium)]
        appearance.setTitleTextAttributes(attributes, for: .normal)
        
        tabBar.layer.cornerRadius = 24
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        tabBar.layer.borderWidth = 0
        tabBar.addShadow(location: .bottom)
    }
    
    deinit {
            print("----------------------------------- TabBarController disposed -----------------------------------")
    }

}



// MARK: - Extension for methods added
extension TabBarController {
    func setTabBarItem() {
        let tabBarItem = UITabBarItem()
        
    }
    
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
