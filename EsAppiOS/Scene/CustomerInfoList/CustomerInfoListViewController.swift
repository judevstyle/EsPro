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
    var menuHamburger = UIBarButtonItem()
    var menuLogout = UIBarButtonItem()
    
    //defaults
    private var query: String = "Customer_info"
    private var searchby: String = "NO"
    private var keyword: String = ""
    private var sortby: String = "NO"
    
    lazy var viewModel: CustomerInfoListProtocol = {
        let vm = CustomerInfoListViewModel(vc: self)
        self.configure(vm)
        self.bindToViewModel()
        return vm
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
    }
    
    func configure(_ interface: CustomerInfoListProtocol) {
        self.viewModel = interface
    }
}

// MARK: - Binding
extension CustomerInfoListViewController {
    
    func bindToViewModel() {
        viewModel.output.didGetCustomerInfoSuccess = didGetCustomerInfoSuccess()
        viewModel.output.didGetCustomerInfoError = didGetCustomerInfoError()
    }
    
    func didGetCustomerInfoSuccess() -> (() -> Void) {
        return { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.tableView.reloadData()
        }
    }
    
    func didGetCustomerInfoError() -> (() -> Void) {
        return { [weak self] in
            guard let weakSelf = self else { return }
//            weakSelf.stopLoding()
//            weakSelf.gotoProductInfomation()
//            weakSelf.openScene(identifier: .SceneMain)
//            weakSelf.openPopupDialog(title: "Incorret")
        }
    }
    
}

//MARK: - SetupUI
extension CustomerInfoListViewController {
    func setupUI(){
        
        setNavBar()
        
        hideKeyboardWhenTappedAround()
//        navigationItem.title = "Customer Information"
        navigationItem.title = "Customer Infomation"
        
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
        btnSearch.addTarget(self, action: #selector(didSearchButton), for: .touchUpInside)
        setRadioSearchBy()
        setRadioSortBy()
        
        inputSearch.setPaddingLeft(padding: 16)
        inputSearch.setPaddingRight(padding: 46)
        inputSearch.setRounded(rounded: 8)
        
        setupRightBarDropDown()
        
        NavigationManager.instance.setupWithNavigationController(navigationController: self.navigationController)
        
    }
    
    @objc func didSearchButton() {
        var request: GetInfoLevel1Request = GetInfoLevel1Request()
        keyword = inputSearch.text ?? ""
        request.query = query
        request.searchby = searchby
        request.keyword = keyword
        request.sortby = sortby
        viewModel.input.getCustomerInfo(request: request)
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
        NavigationManager.instance.setRootViewController(rootView: .productInfoList)
    }
    
    func setRadioSearchBy(){
        radioSearchByGroup.titles = [SearchType.CustomerNo.rawValue, SearchType.CustomerName.rawValue]
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
        radioSortByGroup.titles = [SortType.CustomerNo.rawValue, SortType.CustomerName.rawValue]
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
    @objc func menuHamburgerTapped() {
        rightBarDropDown.show()
    }
    
    @objc func menuLogoutTapped() {
        NavigationManager.instance.setRootViewController(rootView: .login)
    }
    
    @objc func selecedSearchByChange(){
        let searchByType = SearchType(rawValue: radioSearchByGroup.titles[radioSearchByGroup.selectedIndex] ?? "") ?? SearchType.CustomerNo
        searchby = searchByType.value
    }
    
    @objc func selecedSortByChange(){
        let sortByType = SortType(rawValue: radioSortByGroup.titles[radioSortByGroup.selectedIndex] ?? "") ?? SortType.CustomerNo
        sortby = sortByType.value
    }
}


extension CustomerInfoListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (viewModel.output.getNumberOfRowsInSection()) + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.output.getCellForRowAt(tableView, cellForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.output.getHeightForRowAt(tableView, heightForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.input.didSelectRowAt(tableView, didSelectRowAt: indexPath)
    }
}
