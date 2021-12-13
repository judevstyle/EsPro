//
//  CustomerProfileViewController.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 9/19/21.
//

import UIKit

class CustomerProfileViewController: UIViewController {

    @IBOutlet var typeCustomer: UILabel!
    
    @IBOutlet var creditBalanceView: UIView!
    @IBOutlet var conditionCreditView: UIView!
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var tableViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var badgeSaleMan1: BadgeSaleManView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
    }
    
    override func viewWillLayoutSubviews() {
        super.updateViewConstraints()
        self.tableViewHeight?.constant = self.tableView.contentSize.height + 16
    }

}

//MARK: - SetupUI
extension CustomerProfileViewController {
    func setupUI(){
        hideKeyboardWhenTappedAround()
        navigationItem.title = "Customer Profile"

        
        creditBalanceView.addTopBorder(with: UIColor.gray, andWidth: 0.5)
        creditBalanceView.addBottomBorder(with: UIColor.gray, andWidth: 0.5)
        
        conditionCreditView.addBottomBorder(with: UIColor.gray, andWidth: 0.5)
    }
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.separatorStyle = .none
        let itemNib = UINib.init(nibName: "ContactItemTableViewCell", bundle: Bundle.main)
        tableView.register(itemNib, forCellReuseIdentifier: "ContactItemTableViewCell")
        let headerNib = UINib.init(nibName: "ContactHeaderTableViewCell", bundle: Bundle.main)
        tableView.register(headerNib, forCellReuseIdentifier: "ContactHeaderTableViewCell")
        
        tableView.addTopBorder(with: .gray, andWidth: 0.5)
        tableView.addBottomBorder(with: .gray, andWidth: 0.5)
        tableView.addLeftBorder(with: .gray, andWidth: 0.5)
        tableView.addRightBorder(with: .gray, andWidth: 0.5)
    }
}


//TableView
extension CustomerProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3+1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.item == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ContactHeaderTableViewCell", for: indexPath) as! ContactHeaderTableViewCell
            cell.backgroundColor = UIColor.clear
            cell.selectionStyle = .none
//            cell.setupUI()
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ContactItemTableViewCell", for: indexPath) as! ContactItemTableViewCell
            cell.backgroundColor = UIColor.clear
            cell.selectionStyle = .none
//            cell.setupUI()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.item == 0 {
            return UITableView.automaticDimension
        } else {
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
}
