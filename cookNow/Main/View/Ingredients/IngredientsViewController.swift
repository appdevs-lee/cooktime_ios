//
//  IngredientsViewController.swift
//  cookNow
//
//  Created by Awesomepia on 2/8/24.
//

import UIKit

enum SelectIngredientsTab: Int {
    case fruits
    case vegetables
    case meats
}

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
    
    lazy var searchBaseView: UIView = {
        let view = UIView()
        view.isHidden = true
        view.backgroundColor = .useRGB(red: 0, green: 0, blue: 0, alpha: 0.2)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var searchView: SearchTextFieldView = {
        let view = SearchTextFieldView()
        view.searchTextField.delegate = self
        view.searchCancelButton.addTarget(self, action: #selector(searchCancelButton(_:)), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    // MARK: - View Pager Property
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.headerReferenceSize = .zero
        flowLayout.footerReferenceSize = .zero
        flowLayout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        collectionView.register(ViewPagerCollectionViewCell.self, forCellWithReuseIdentifier: "ViewPagerCollectionViewCell")
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.bounces = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()

    lazy var pageViewController: UIPageViewController = {
        let pageVC = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageVC.delegate = self
        pageVC.dataSource = self
        pageVC.view.translatesAutoresizingMaskIntoConstraints = false
        pageVC.didMove(toParent: self)
        
        let firstVC = UIViewController()
        firstVC.title = "과일"
        
        let secondVC = UIViewController()
        secondVC.title = "채소"
        
        let thirdVC = UIViewController()
        thirdVC.title = "고기"
        
        self.subControllers = [firstVC, secondVC, thirdVC]
        return pageVC
    }()
    
    var subControllers: [UIViewController] = []
    var currentIndex: Int = 0
    
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
        self.setPageViewController()
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
        // MARK: View Pager Subivews
        self.view.addSubview(self.collectionView)
        self.view.addSubview(self.contentView)
        addChild(self.pageViewController)
        self.contentView.addSubview(self.pageViewController.view)
        
        SupportingMethods.shared.addSubviews([
            self.guideLabel,
            self.searchBaseView,
            self.searchView
        ], to: self.view)
    }
    
    func setLayouts() {
        let safeArea = self.view.safeAreaLayoutGuide
        
        // guideLabel
        NSLayoutConstraint.activate([
            self.guideLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            self.guideLabel.topAnchor.constraint(equalTo: safeArea.topAnchor)
        ])
        
        // searchBaseView
        NSLayoutConstraint.activate([
            self.searchBaseView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.searchBaseView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.searchBaseView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.searchBaseView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        // searchTextField
        NSLayoutConstraint.activate([
            self.searchView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            self.searchView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            self.searchView.topAnchor.constraint(equalTo: self.guideLabel.bottomAnchor, constant: 10),
            self.searchView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // collectionView
        NSLayoutConstraint.activate([
            self.collectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            self.collectionView.topAnchor.constraint(equalTo: self.searchView.bottomAnchor, constant: 20),
            self.collectionView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // contentView
        NSLayoutConstraint.activate([
            self.contentView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            self.contentView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            self.contentView.topAnchor.constraint(equalTo: self.collectionView.bottomAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
        
        // pageViewController.view
        NSLayoutConstraint.activate([
            self.pageViewController.view.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.pageViewController.view.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            self.pageViewController.view.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.pageViewController.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
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
    
    func setPageViewController() {
        self.pageViewController.setViewControllers([self.subControllers[self.currentIndex]], direction: .forward, animated: true)
    }
}

// MARK: - Extension for methods added
extension IngredientsViewController {
    func select(index: SelectIngredientsTab) {
        var direction: UIPageViewController.NavigationDirection = .forward
        if index.rawValue > self.currentIndex {
            direction = .forward
            
        } else {
            direction = .reverse
            
        }
        
        self.currentIndex = index.rawValue
        self.pageViewController.setViewControllers([self.subControllers[index.rawValue]], direction: direction, animated: false)
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            
        }
        
    }
}

// MARK: - Extension for selector methods
extension IngredientsViewController {
    @objc func searchCancelButton(_ sender: UIButton) {
        self.searchView.searchTextField.text = ""
        self.searchView.searchTextField.resignFirstResponder()
    }
}

// MARK: - Extension for UITextFieldDelegate
extension IngredientsViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.searchView.changeDesignForSearching()
        self.searchBaseView.isHidden = false
        
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        self.searchView.changeDesignSearchDone()
        self.searchBaseView.isHidden = true
        
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.text == "" {
            self.searchView.resultView.isHidden = true
            
        } else {
            self.searchView.resultView.isHidden = false
            
        }
    }
}

// MARK: - Extension for UIPageViewControllerDataSource, UIPageViewControllerDelegate
extension IngredientsViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = self.subControllers.firstIndex(of: viewController) else { return nil }
        let previousIndex = index - 1
        if previousIndex < 0 {
            return nil
        }
        
        return self.subControllers[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = self.subControllers.firstIndex(of: viewController) else { return nil }
        let nextIndex = index + 1
        if nextIndex == self.subControllers.count {
            return nil
        }
        return self.subControllers[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            guard let vc = self.pageViewController.viewControllers?.first else {
                self.currentIndex = 0
                return
            }
            self.currentIndex = self.subControllers.firstIndex(of: vc) ?? 0
            
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}

extension IngredientsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: ReferenceValues.Size.Device.width / CGFloat(self.subControllers.count), height: 50)
        return CGSize(width: 84, height: 35)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.subControllers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ViewPagerCollectionViewCell", for: indexPath) as! ViewPagerCollectionViewCell
        let title = self.subControllers[indexPath.row].title!
        
        cell.newView.isHidden = true
        cell.setCell(title: title)
        
        if indexPath.row == self.currentIndex {
            cell.titleLabel.textColor = .useRGB(red: 28, green: 157, blue: 46)
            cell.indicatorView.backgroundColor = .useRGB(red: 28, green: 157, blue: 46)
        } else {
            cell.titleLabel.textColor = .useRGB(red: 189, green: 189, blue: 189)
            cell.indicatorView.backgroundColor = .useRGB(red: 189, green: 189, blue: 189)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var direction: UIPageViewController.NavigationDirection = .forward
        if indexPath.row > self.currentIndex {
            direction = .forward
        } else {
            direction = .reverse
        }
        
        self.currentIndex = indexPath.row
        self.pageViewController.setViewControllers([self.subControllers[indexPath.row]], direction: direction, animated: true)
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            
        }
        
    }
    
}
