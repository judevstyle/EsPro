//
//  CustomerProfileViewController.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 9/19/21.
//

import UIKit

class CustomerProfileViewController: UIViewController {
    
    @IBOutlet var creditBalanceView: UIView!
    @IBOutlet var conditionCreditView: UIView!
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var tableViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var badgeSaleMan1: BadgeSaleManView!
    @IBOutlet weak var badgeSaleMan2: BadgeSaleManView!
    @IBOutlet weak var badgeSaleMan3: BadgeSaleManView!
    @IBOutlet weak var badgeSaleMan4: BadgeSaleManView!
    
    @IBOutlet weak var customerNoValue: UILabel!
    @IBOutlet weak var nameThaiValue: UILabel!
    @IBOutlet weak var nameEngValue: UILabel!
    @IBOutlet weak var shortNameValue: UILabel!
    @IBOutlet weak var addresValue: UILabel!
    @IBOutlet weak var postCodeValue: UILabel!
    @IBOutlet weak var telValue: UILabel!
    @IBOutlet weak var faxValue: UILabel!
    @IBOutlet weak var personalCodeValue: UILabel!
    @IBOutlet weak var branchValue: UILabel!
    @IBOutlet weak var dateOnSaveValue: UILabel!
    @IBOutlet weak var saleNameValue: UILabel!
    
    @IBOutlet weak var creditValue: UILabel!
    @IBOutlet weak var amountValue: UILabel!
    @IBOutlet weak var creditAmountValue: UILabel!
    @IBOutlet weak var arValue: UILabel!
    @IBOutlet weak var chqRetValue: UILabel!
    @IBOutlet weak var termValue: UILabel!
    @IBOutlet weak var conditionValue: UILabel!
    @IBOutlet weak var remValue: UILabel!
    @IBOutlet weak var rem2Value: UILabel!
    
    @IBOutlet weak var descValue: UILabel!
    @IBOutlet weak var bussCodeValue: UILabel!
    @IBOutlet weak var bussProdValue: UILabel!
    
    lazy var viewModel: CustomerProfileProtocol = {
        let vm = CustomerProfileViewModel(vc: self)
        self.configure(vm)
        self.bindToViewModel()
        return vm
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
        
        viewModel.input.getCustomerProfile()
    }
    
    override func viewWillLayoutSubviews() {
        super.updateViewConstraints()
        self.tableViewHeight?.constant = self.tableView.contentSize.height + 16
    }
    
    func configure(_ interface: CustomerProfileProtocol) {
        self.viewModel = interface
    }

}

// MARK: - Binding
extension CustomerProfileViewController {
    
    func bindToViewModel() {
        viewModel.output.didGetCustomerProfileSuccess = didGetCustomerProfileSuccess()
        viewModel.output.didGetCustomerProfileError = didGetCustomerProfileError()
    }
    
    func didGetCustomerProfileSuccess() -> (() -> Void) {
        return { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.setupValue()
        }
    }
    
    func didGetCustomerProfileError() -> (() -> Void) {
        return { [weak self] in
            guard let weakSelf = self else { return }
        }
    }
    
    
    private func setupValue() {
        guard let item = viewModel.output.getDataCustomerProfile() else { return }
        
        customerNoValue.text = "\(item.CUSTOMER_NO ?? 0)"
        nameThaiValue.text = item.NAME ?? ""
        nameEngValue.text = item.NAMEENG ?? ""
        shortNameValue.text = item.SHORTNAME ?? ""
 
        
        let attributedString = NSMutableAttributedString(string: "\(item.ADDR ?? "")\n\(item.ADDRL2 ?? "")")
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.75
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        addresValue.attributedText = attributedString
        
        postCodeValue.text = item.POSTCODE ?? ""
        telValue.text = item.TEL ?? ""
        faxValue.text = item.FAX ?? ""
        personalCodeValue.text = item.TAX_ID ?? ""
        branchValue.text = item.BRANCH ?? ""
        dateOnSaveValue.text = "\(item.OPEN_DATE?.convertToDate()?.getFormattedDate(format: "dd/MM/yyyy") ?? "")"
        saleNameValue.text = item.SALENAME ?? ""
        
        badgeSaleMan1.titleText.text = item.SALECODE1 ?? ""
        badgeSaleMan2.titleText.text = item.SALECODE2 ?? ""
        badgeSaleMan3.titleText.text = item.SALECODE3 ?? ""
        badgeSaleMan4.titleText.text = item.SALECODE4 ?? ""
        
        creditValue.text = "\(item.CREDIT ?? 0)"
        amountValue.text = "\(item.AMOUNT ?? 0)"
        creditAmountValue.text = "\(item.CREDIT_AMOUNT ?? 0)"
        arValue.text = "\(item.AR ?? 0)"
        chqRetValue.text = "\(item.CHQ_RET ?? 0)"
        termValue.text = "\(item.TERM ?? 0)"
        
        conditionValue.text = item.CONDITION ?? ""
        remValue.text = "\(item.REM ?? "")\n\(item.REM1 ?? "")"
        rem2Value.text = item.REM2 ?? ""
        
        descValue.text = "\(item.DESCRIPTION1 ?? "")\n\(item.DESCRIPTION2 ?? "")\n\(item.DESCRIPTION3 ?? "")"
        bussCodeValue.text = "\(item.BUSS_CODE1 ?? "")\n\(item.BUSS_CODE2 ?? "")\n\(item.BUSS_CODE3 ?? "")\n\(item.BUSS_CODE4 ?? "")"
        bussProdValue.text = "\(item.BUSS_PROD1 ?? "")\n\(item.BUSS_PROD2 ?? "")\n\(item.BUSS_PROD3 ?? "")\n\(item.BUSS_PROD4 ?? "")"
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
        return 1+1
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
            let item = viewModel.output.getDataCustomerProfile()
            cell.data = item
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
