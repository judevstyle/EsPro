//
//  CustomerInfoListViewController.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 5/4/21.
//

import UIKit
import RadioGroup

class CustomerInfoListViewController: UIViewController {
    
    @IBOutlet weak var bgTopView: UIView!
    @IBOutlet weak var radioSearchByGroup: RadioGroup!
    @IBOutlet weak var radioSortByGroup: RadioGroup!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var inputSearch: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
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
        
        let menuRight = UIBarButtonItem()
        menuRight.action = #selector(menuTapped)
        menuRight.image = UIImage(named: "menu")?.withRenderingMode(.alwaysTemplate)
        menuRight.tintColor = .black
        navigationItem.rightBarButtonItem = menuRight
        
        btnSearch.setRounded(rounded: 8)
        setRadioSearchBy()
        setRadioSortBy()
        
        inputSearch.setPaddingLeft(padding: 16)
        inputSearch.setPaddingRight(padding: 46)
        inputSearch.setRounded(rounded: 8)
        
    }
    
    func setRadioSearchBy(){
        radioSearchByGroup.titles = [SearchType.ES.rawValue, SearchType.MFR.rawValue]
        radioSearchByGroup.tintColor = .white       // surrounding ring
        radioSearchByGroup.selectedColor = .white
        radioSearchByGroup.selectedIndex = 0
        radioSearchByGroup.titleFont = UIFont.PrimaryLight(size: 18)
        radioSearchByGroup.titleColor = .white
        radioSearchByGroup.itemSpacing = 8
        radioSearchByGroup.buttonSize = 21
        radioSearchByGroup.spacing = 0
        radioSearchByGroup.isVertical = true
        radioSearchByGroup.titleAlignment = .left
        radioSearchByGroup.addTarget(self, action: #selector(selecedSearchByChange), for: .valueChanged)
    }
    
    func setRadioSortBy(){
        radioSortByGroup.titles = [SearchType.ES.rawValue, SearchType.MFR.rawValue]
        radioSortByGroup.tintColor = .white      // surrounding ring
        radioSortByGroup.selectedColor = .white
        radioSortByGroup.selectedIndex = 0
        radioSortByGroup.titleFont = UIFont.PrimaryLight(size: 18)
        radioSortByGroup.titleColor = .white
        radioSortByGroup.itemSpacing = 8
        radioSortByGroup.buttonSize = 21
        radioSortByGroup.spacing = 0
        radioSortByGroup.isVertical = true
        radioSortByGroup.titleAlignment = .left
        radioSortByGroup.addTarget(self, action: #selector(selecedSortByChange), for: .valueChanged)
    }
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        let headerNib = UINib.init(nibName: "CustomerInfoHeaderTableViewCell", bundle: Bundle.main)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "CustomerInfoHeaderTableViewCell")
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.separatorStyle = .none
        let customerInfoNib = UINib.init(nibName: "CustomerInfoListTableViewCell", bundle: Bundle.main)
        tableView.register(customerInfoNib, forCellReuseIdentifier: "CustomerInfoListTableViewCell")
    }
}
//MARK:- Event
extension CustomerInfoListViewController {
    @objc func menuTapped() {
        
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CustomerInfoHeaderTableViewCell") as! CustomerInfoHeaderTableViewCell
        return headerView
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomerInfoListTableViewCell", for: indexPath) as! CustomerInfoListTableViewCell
        //                        cell.item = listProductSpecification[indexPath.item]
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.item)
    }
}
