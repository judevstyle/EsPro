//
//  CustomerInfoDetailViewController.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 5/9/21.
//

import UIKit

class CustomerInfoDetailViewController: UIViewController {

    @IBOutlet weak var bgTopView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var customerNo: UILabel!
    @IBOutlet weak var customerName: UILabel!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    var mockDataList: [CustomerInfoDetailListModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
        mockData()
    }
    
}

//MARK: - SetupUI
extension CustomerInfoDetailViewController {
    func setupUI(){
        hideKeyboardWhenTappedAround()
//        navigationItem.title = "Customer Information"
        navigationItem.title = "Customer Infomation"
        
        bgTopView.setRounded(rounded: 8)
        
//        let menuRight = UIBarButtonItem()
//        menuRight.action = #selector(menuTapped)
//        menuRight.image = UIImage(named: "menu")?.withRenderingMode(.alwaysTemplate)
//        menuRight.tintColor = .darkGray
//        navigationItem.rightBarButtonItem = menuRight
        
//        let backLeft = UIBarButtonItem()
//        backLeft.target = self
//        backLeft.action = #selector(dismissTapped)
//        backLeft.image = UIImage(systemName: "arrow.left")?.withRenderingMode(.alwaysTemplate)
//        backLeft.tintColor = .darkGray
//        navigationItem.leftBarButtonItem = backLeft

    }
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.separatorStyle = .none
        let customerInfoNib = UINib.init(nibName: "CustomerInfoDetailTableViewCell", bundle: Bundle.main)
        tableView.register(customerInfoNib, forCellReuseIdentifier: "CustomerInfoDetailTableViewCell")
        tableView.layer.borderWidth = 1
        tableView.layer.borderColor = UIColor.lightGray.cgColor
        tableView.layer.cornerRadius = 20
        tableView.isScrollEnabled = false
    }
    
    func mockData() {
        mockDataList.append(CustomerInfoDetailListModel(arrowImage: "", title: "Customer Profile", iconImage: "user"))
        mockDataList.append(CustomerInfoDetailListModel(arrowImage: "", title: "This Month Sell", iconImage: "sale"))
        mockDataList.append(CustomerInfoDetailListModel(arrowImage: "", title: "Sell History", iconImage: "history"))
        mockDataList.append(CustomerInfoDetailListModel(arrowImage: "", title: "D/O Report", iconImage: "report"))
    }
}

//MARK:- Event
extension CustomerInfoDetailViewController {
    @objc func menuTapped() {
        
    }
    
    @objc func dismissTapped() {
        debugPrint("dismissTapped")
        self.navigationController?.popViewController(animated: true)
    }
}

extension CustomerInfoDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableViewHeight.constant = CGFloat(65*self.mockDataList.count)
        return self.mockDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomerInfoDetailTableViewCell", for: indexPath) as! CustomerInfoDetailTableViewCell
        cell.data = mockDataList[indexPath.item]
        cell.setupValue()
        
        
        let newframe = CGRect(origin: .zero, size: CGSize(width: 320, height: 65))

        self.navigationController?.navigationBar.barTintColor = UIColor.gradientColor(startColor: .NavBarTop(), endColor: .NavBarBottom(), frame: newframe)
        
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.gradientColor(startColor: .NavBarTop(), endColor: .NavBarBottom(), frame: newframe)
        cell.selectedBackgroundView = bgColorView
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.mockDataList.count == 0 {
            return 0
        }
        return 65
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.item == 0 {
            self.openScene(identifier: .SceneCustomerProfile)
        }
    }
    
    
}
