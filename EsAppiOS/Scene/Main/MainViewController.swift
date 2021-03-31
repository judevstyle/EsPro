//
//  MainViewController.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 3/26/21.
//

import UIKit
import RadioGroup
import DropDown

class MainViewController: UIViewController {
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var UsernameLabel: UILabel!
    @IBOutlet weak var UserIDLabel: UILabel!
    @IBOutlet weak var btnShutdown: UIButton!
    @IBOutlet weak var radioGroup: RadioGroup!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var viewRadioGroup: UIView!
    @IBOutlet weak var inputSearch: UITextField!
    @IBOutlet weak var sortByButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    let dropDown = DropDown()
    
    // ViewModel
    lazy var viewModel: MainProtocol = {
        let vm = MainViewModel(vc: self)
        self.configure(vm)
        self.bindToViewModel()
        return vm
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func configure(_ interface: MainProtocol) {
        self.viewModel = interface
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.input.searchProduct(searchType: .ES)
    }
}


// MARK: - Binding
extension MainViewController {
    
    func bindToViewModel() {
        viewModel.output.didGetProductSuccess = didGetProductSuccess()
        viewModel.output.didGetProductError = didGetProductError()
        viewModel.output.didSortProductResult = didSortProductResult()
    }
    
    func didGetProductSuccess() -> (() -> Void) {
        return { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.tableView.reloadData()
            weakSelf.viewModel.input.sortProduct(sortType: .None, vc: weakSelf)
        }
    }
    
    func didGetProductError() -> (() -> Void) {
        return { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.tableView.reloadData()
        }
    }
    
    func didSortProductResult() -> (() -> Void) {
        return { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.tableView.reloadData()
        }
    }
    
}

//MARK: - SetupUI
extension MainViewController {
    func setupUI(){
        hideKeyboardWhenTappedAround()
        btnShutdown.setImage(UIImage(named: "shutdown")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btnShutdown.tintColor = .white
        
        btnSearch.setImage(UIImage(systemName: "magnifyingglass")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btnSearch.contentVerticalAlignment = .fill
        btnSearch.contentHorizontalAlignment = .fill
        btnSearch.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        btnSearch.imageView?.contentMode = .scaleAspectFill
        
        userImage.setRounded(rounded: userImage.frame.size.height/2)
        setRadioSearchProduct()
        
        viewRadioGroup.setRounded(rounded: 8)
        inputSearch.setPaddingLeft(padding: 16)
        inputSearch.setPaddingRight(padding: 46)
        inputSearch.setRounded(rounded: 8)
        
        sortByButton.layer.cornerRadius = 5
        sortByButton.layer.borderWidth = 1
        sortByButton.layer.borderColor = UIColor.darkGray.cgColor
        
        setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        let headerNib = UINib.init(nibName: "DataListSectionHeader", bundle: Bundle.main)
        tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "DataListSectionHeader")
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func setRadioSearchProduct(){
        radioGroup.titles = [SearchType.ES.rawValue, SearchType.MFR.rawValue]
        radioGroup.tintColor = .red       // surrounding ring
        radioGroup.selectedColor = .red
        radioGroup.selectedIndex = 0
        radioGroup.titleFont = UIFont.PrimaryLight(size: 18)
        radioGroup.itemSpacing = 8
        radioGroup.buttonSize = 21
        radioGroup.spacing = 0
        radioGroup.isVertical = true
        radioGroup.titleAlignment = .left
        radioGroup.addTarget(self, action: #selector(selecedSearchChange), for: .valueChanged)
    }
    
    @objc func selecedSearchChange(){
        let searchType = SearchType(rawValue: radioGroup.titles[radioGroup.selectedIndex] ?? "") ?? SearchType.ES
        viewModel.input.searchProduct(searchType: searchType)
    }
}

//MARK: - Event
extension MainViewController {
    @IBAction func btnTappedShutdown(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func tapChooseSortBy(_ sender: UIButton) {
        dropDown.dataSource = [SortType.None.rawValue, SortType.ES.rawValue, SortType.MFR.rawValue]
        dropDown.anchorView = sortByButton
        dropDown.textFont = UIFont.PrimaryLight(size: 18)
        dropDown.textColor = .darkGray
        dropDown.bottomOffset = CGPoint(x: 0, y: sortByButton.frame.size.height)
        dropDown.show()
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in
            guard let self = self else { return }
            let sortType = SortType(rawValue: item) ?? SortType.None
            self.viewModel.input.sortProduct(sortType: sortType, vc: self)
        }
    }
    
    func getListProduct(request: ProductRequest) {
        viewModel.input.getProduct(request: request)
    }
    
    @IBAction func TappedSearchIcon(_ sender: Any) {
//        self.inputSearch.becomeFirstResponder()
        
    }
}


extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "DataListSectionHeader") as! DataListSectionHeader
        
           return headerView
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 83
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.output.getSizeListProduct()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellDataList", for: indexPath) as! DataListViewCell
        cell.selectionStyle = .gray
        cell.dataListView.item = viewModel.output.getItemProduct(index: indexPath.item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.item)
    }
    
    
}
