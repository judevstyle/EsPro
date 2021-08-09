//
//  CustomerInfoListViewController.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 5/4/21.
//

import UIKit
import RadioGroup
import DropDown

class CustomerInfoListViewController: UIViewController {
    
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
    var menuRight = UIBarButtonItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
    }
}

//MARK: - SetupUI
extension CustomerInfoListViewController {
    func setupUI(){
        hideKeyboardWhenTappedAround()
//        navigationItem.title = "Customer Information"
        navigationItem.title = "Customer Infomation"
        
        bgTopView.setRounded(rounded: 8)
        

        menuRight.target = self
        menuRight.action = #selector(menuTapped)
        menuRight.image = UIImage(named: "menu")?.withRenderingMode(.alwaysTemplate)
        menuRight.tintColor = .black
        navigationItem.rightBarButtonItem = menuRight
        
        logoTobnav.image = UIImage(named: "logo-topnav")?.withRenderingMode(.alwaysOriginal)
        logoTobnav.isEnabled = false
        
        let font = [NSAttributedString.Key.font: UIFont.Primary(size: 21)]
        menuUserTopNav.setTitleTextAttributes(font, for: .normal)
        menuAdminTopNav.setTitleTextAttributes(font, for: .normal)
        
        menuUserTopNav.tintColor = UIColor.black
        menuAdminTopNav.tintColor = UIColor.init(named: "NewPrimary")
        
//        let backLeft = UIBarButtonItem()
//        backLeft.action = #selector(menuTapped)
//        backLeft.image = UIImage(systemName: "arrow.left")?.withRenderingMode(.alwaysTemplate)
//        backLeft.tintColor = .darkGray
//        navigationItem.leftBarButtonItem = backLeft
        
        btnSearch.setRounded(rounded: 8)
        setRadioSearchBy()
        setRadioSortBy()
        
        inputSearch.setPaddingLeft(padding: 16)
        inputSearch.setPaddingRight(padding: 46)
        inputSearch.setRounded(rounded: 8)
        
        setupRightBarDropDown()
        
    }
    
    func setupRightBarDropDown() {
        rightBarDropDown.anchorView = menuRight
        
        // You can also use localizationKeysDataSource instead. Check the docs.
        rightBarDropDown.dataSource = [
            "Product Information",
            "Customer Information"
        ]
        rightBarDropDown.selectRow(1)
        
        rightBarDropDown.selectionBackgroundColor = UIColor.init(named: "PrimaryColor")?.withAlphaComponent(0.7) ?? .white
        rightBarDropDown.selectedTextColor = .white
        rightBarDropDown.bottomOffset = CGPoint(x: 0, y: 45)
        
        rightBarDropDown.selectionAction = { [weak self] (index, item) in
            self?.rightBarDropDown.selectRow(index)
            if index == 0 {
                self?.gotoProductInfomation()
            }
        }
    }
    
    private func gotoProductInfomation(){
        UIView.transition(
             with: UIApplication.shared.keyWindow!,
             duration: 0.25,
             options: .transitionFlipFromLeft,
             animations: {
                let loadingStoryBoard = "ProductInfoList"
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
        radioSearchByGroup.buttonSize = 21
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
        radioSortByGroup.buttonSize = 21
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
        let customerInfoNib = UINib.init(nibName: "CustomerInfoListTableViewCell", bundle: Bundle.main)
        tableView.register(customerInfoNib, forCellReuseIdentifier: "CustomerInfoListTableViewCell")
        
        let customerHeadInfoNib = UINib.init(nibName: "CustomerInfoHeaderTableViewCell", bundle: Bundle.main)
        tableView.register(customerHeadInfoNib, forCellReuseIdentifier: "CustomerInfoHeaderTableViewCell")
    }
}
//MARK:- Event
extension CustomerInfoListViewController {
    @objc func menuTapped() {
        rightBarDropDown.show()
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


extension CustomerInfoListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CustomerInfoHeaderTableViewCell") as! CustomerInfoHeaderTableViewCell
//        return headerView
//    }
//
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 60
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //                        cell.item = listProductSpecification[indexPath.item]
        if indexPath.item == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomerInfoHeaderTableViewCell", for: indexPath) as! CustomerInfoHeaderTableViewCell
            cell.backgroundColor = UIColor.clear
            cell.selectionStyle = .none
            cell.setupUI()
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomerInfoListTableViewCell", for: indexPath) as! CustomerInfoListTableViewCell
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
            self.openScene(identifier: .SceneCustomerInformationDetail)
        }
    }
}
