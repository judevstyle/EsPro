//
//  ProductInfoListViewController.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 5/4/21.
//

import UIKit
import RadioGroup
import DropDown

class ProductInfoListViewController: UIViewController {
    
    
    @IBOutlet weak var bgTopView: UIView!
    @IBOutlet weak var radioSearchByGroup: RadioGroup!
    @IBOutlet weak var radioSortByGroup: RadioGroup!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var inputSearch: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet var logoTobnav: UIBarButtonItem!
    @IBOutlet var menuUserTopNav: UIBarButtonItem!
    @IBOutlet var menuAdminTopNav: UIBarButtonItem!
    
    
    let rightBarDropDown = DropDown()
    var menuHamburger = UIBarButtonItem()
    var menuLogout = UIBarButtonItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
    }
}

//MARK: - SetupUI
extension ProductInfoListViewController {
    func setupUI(){
        
        setNavBar()
        
        hideKeyboardWhenTappedAround()
        navigationItem.title = "Product Information"
        
        bgTopView.setRounded(rounded: 8)
    
        // menuHamburger
        menuHamburger.target = self
        menuHamburger.action = #selector(menuHamburgerTapped)
        menuHamburger.image = UIImage(named: "menu")?.withRenderingMode(.alwaysTemplate)
        menuHamburger.tintColor = .black
        
        // menuLogout
        let btnLogout = UIButton.init(type: .custom)
        btnLogout.setTitle("LOGOUT", for: .normal)
        btnLogout.setTitleColor(.darkGray, for: .normal)
        btnLogout.layer.borderWidth = 1
        btnLogout.layer.cornerRadius = 16
        btnLogout.layer.borderColor = UIColor.lightGray.cgColor
        btnLogout.backgroundColor = .white
        btnLogout.titleLabel?.font = UIFont.Primary(size: 21)
        btnLogout.addBtnLogoutPadding()
        btnLogout.addTarget(self, action: #selector(self.menuLogoutTapped), for: .touchUpInside)
        
        menuLogout = UIBarButtonItem(customView: btnLogout)
        
        navigationItem.rightBarButtonItems = [menuHamburger, menuLogout]
        
//        let backLeft = UIBarButtonItem()
//        backLeft.action = #selector(menuTapped)
//        backLeft.image = UIImage(systemName: "arrow.left")?.withRenderingMode(.alwaysTemplate)
//        backLeft.tintColor = .darkGray
//        navigationItem.leftBarButtonItem = backLeft
        
        logoTobnav.image = UIImage(named: "logo-topnav")?.withRenderingMode(.alwaysOriginal)
//        logoTobnav.imageInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        logoTobnav.isEnabled = false
        
        let font = [NSAttributedString.Key.font: UIFont.Primary(size: 21)]
        menuUserTopNav.setTitleTextAttributes(font, for: .normal)
        menuAdminTopNav.setTitleTextAttributes(font, for: .normal)
        
        menuUserTopNav.tintColor = UIColor.black
        menuAdminTopNav.tintColor = UIColor.init(named: "NewPrimary")
        
        
        btnSearch.setRounded(rounded: 8)
        setRadioSearchBy()
        setRadioSortBy()
        
        inputSearch.setPaddingLeft(padding: 16)
        inputSearch.setPaddingRight(padding: 46)
        inputSearch.setRounded(rounded: 8)
    
        setupRightBarDropDown()
    }
    
    func setNavBar() {
        if let navFrame = self.navigationController?.navigationBar.frame {
            if #available(iOS 13.0, *) {
                let navBarAppearance = UINavigationBarAppearance()
                navBarAppearance.configureWithOpaqueBackground()
                navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
                navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
                let newframe = CGRect(origin: .zero, size: CGSize(width: navFrame.width, height: (navFrame.height + UIApplication.shared.statusBarFrame.height) ))
                navBarAppearance.backgroundColor =  UIColor.gradientColor(startColor: .NavBarTop(), endColor: .NavBarBottom(), frame: newframe)
                self.navigationController?.navigationBar.standardAppearance = navBarAppearance
                self.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
            } else {
                let newframe = CGRect(origin: .zero, size: CGSize(width: navFrame.width, height: (navFrame.height + UIApplication.shared.statusBarFrame.height) ))

                self.navigationController?.navigationBar.barTintColor = UIColor.gradientColor(startColor: .NavBarTop(), endColor: .NavBarBottom(), frame: newframe)
            }
        }
    }
    
    func setupRightBarDropDown() {
        rightBarDropDown.anchorView = menuHamburger
        
        // You can also use localizationKeysDataSource instead. Check the docs.
        rightBarDropDown.dataSource = [
            "Product Information",
            "Customer Information"
        ]
        rightBarDropDown.selectRow(0)
        
        rightBarDropDown.selectionBackgroundColor = UIColor.init(named: "PrimaryColor")?.withAlphaComponent(0.7) ?? .white
        rightBarDropDown.selectedTextColor = .white
        rightBarDropDown.bottomOffset = CGPoint(x: 0, y: 45)
        
        rightBarDropDown.selectionAction = { [weak self] (index, item) in
            self?.rightBarDropDown.selectRow(index)
            if index == 1 {
                self?.gotoCustomerInfomation()
            }
        }
    }
    
    private func gotoCustomerInfomation(){
        UIView.transition(
             with: UIApplication.shared.keyWindow!,
             duration: 0.25,
             options: .transitionFlipFromLeft,
             animations: {
                let loadingStoryBoard = "CustomerInfoList"
                // Override point for customization after application launch.
                let storyboard = UIStoryboard(name: loadingStoryBoard, bundle: nil)
                let initialViewController = storyboard.instantiateInitialViewController()

                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window?.rootViewController = initialViewController
                appDelegate.window?.makeKeyAndVisible()
         })
    }
    
    func setRadioSearchBy(){
        radioSearchByGroup.titles = [SearchType.ES.rawValue, SearchType.MFR.rawValue]
        radioSearchByGroup.tintColor = .white       // surrounding ring
//        radioSearchByGroup.selectedColor = .white
        radioSearchByGroup.selectedIndex = 0
//        radioSearchByGroup.titleFont = UIFont.Primary(size: 18)
        radioSearchByGroup.titleColor = .white
        radioSearchByGroup.itemSpacing = 8
        radioSearchByGroup.buttonSize = 18
//        radioSearchByGroup.spacing = 0
        radioSearchByGroup.isVertical = true
        radioSearchByGroup.titleAlignment = .left
        radioSearchByGroup.addTarget(self, action: #selector(selecedSearchByChange), for: .valueChanged)
    }
    
    func setRadioSortBy(){
        radioSortByGroup.titles = [SearchType.ES.rawValue, SearchType.MFR.rawValue]
        radioSortByGroup.tintColor = .white      // surrounding ring
//        radioSortByGroup.selectedColor = .white
        radioSortByGroup.selectedIndex = 0
//        radioSortByGroup.titleFont = UIFont.Primary(size: 18)
        radioSortByGroup.titleColor = .white
        radioSortByGroup.itemSpacing = 8
        radioSortByGroup.buttonSize = 18
//        radioSortByGroup.spacing = 0
        radioSortByGroup.isVertical = true
        radioSortByGroup.titleAlignment = .left
        radioSortByGroup.addTarget(self, action: #selector(selecedSortByChange), for: .valueChanged)
    }
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.separatorStyle = .none
        let productInfoNib = UINib.init(nibName: "ProductInfoListTableViewCell", bundle: Bundle.main)
        tableView.register(productInfoNib, forCellReuseIdentifier: "ProductInfoListTableViewCell")
        let productHeaderInfoNib = UINib.init(nibName: "ProductInfoHeaderTableViewCell", bundle: Bundle.main)
        tableView.register(productHeaderInfoNib, forCellReuseIdentifier: "ProductInfoHeaderTableViewCell")
    }
}
//MARK:- Event
extension ProductInfoListViewController {
    @objc func menuHamburgerTapped() {
        rightBarDropDown.show()
    }
    
    @objc func menuLogoutTapped() {
        
        UIView.transition(
             with: UIApplication.shared.keyWindow!,
             duration: 0.25,
             options: .transitionFlipFromLeft,
             animations: {
                let loadingStoryBoard = "Login"
                // Override point for customization after application launch.
                let storyboard = UIStoryboard(name: loadingStoryBoard, bundle: nil)
                let initialViewController = storyboard.instantiateInitialViewController()

                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window?.rootViewController = initialViewController
                appDelegate.window?.makeKeyAndVisible()
         })
        
    }
    
    @objc func selecedSearchByChange(){
        let searchByType = SearchType(rawValue: radioSearchByGroup.titles[radioSearchByGroup.selectedIndex] ?? "") ?? SearchType.ES
        print(searchByType.rawValue)
    }
    
    @objc func selecedSortByChange(){
        let sortByType = SearchType(rawValue: radioSortByGroup.titles[radioSortByGroup.selectedIndex] ?? "") ?? SearchType.ES
        print(sortByType.rawValue)
    }
}


extension ProductInfoListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.item == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductInfoHeaderTableViewCell", for: indexPath) as! ProductInfoHeaderTableViewCell
            cell.backgroundColor = UIColor.clear
            cell.selectionStyle = .none
            cell.setupUI()
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductInfoListTableViewCell", for: indexPath) as! ProductInfoListTableViewCell
            cell.backgroundColor = UIColor.clear
            cell.selectionStyle = .none
            cell.setupUI()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.item == 0 {
            return 60
        } else {
            return 44
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.item == 0 {
        } else {
            self.openScene(identifier: .SceneProductInformationDetail)
        }
    }
}

extension UIButton {
    func addBtnLogoutPadding() {
        titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        contentEdgeInsets = UIEdgeInsets(top: 8.0, left: 16.0, bottom: 5.0, right: 16.0)
    }
}
