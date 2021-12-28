//
//  ProductInfoViewController.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 17/4/2564 BE.
//

import UIKit
import BetterSegmentedControl

class ProductInfoViewController: UIViewController {
    
    @IBOutlet var imageCollectionView: UICollectionView!
    private let imageCollectionViewCellId: String = "ImageCollectionViewCell"
    
    @IBOutlet weak var priceTableView: UITableView!
    @IBOutlet weak var inventoryTableView: UITableView!
    @IBOutlet weak var inventoryTableViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var shipmentTableView: UITableView!
    @IBOutlet weak var shipmentTableViewHeight: NSLayoutConstraint!
    
    //headerSegmentControlProductView
    @IBOutlet weak var headerSegmentControlProductView: UIView!
    @IBOutlet weak var productTableView: UITableView!
    
    
    //similar & related
    @IBOutlet weak var similarTableView: UITableView!
    @IBOutlet weak var similarTableViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var relatedTableView: UITableView!
    @IBOutlet weak var relatedTableViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var viewTopProduct: UIView!
    @IBOutlet weak var viewProduct: UIView!
    @IBOutlet weak var viewProductHeight: NSLayoutConstraint!
    
    @IBOutlet weak var priceVatValue: UILabel!
    
    @IBOutlet weak var pricePerUnitValue: UILabel!
    
    private let viewProductConstantHeight: CGFloat = (324 - 235)
    
    var listShipmentTable: [ShipmentTableModel] = []
    
    var listProductInformation: [ProductTableModel] = []
    var listProductSpecification: [ProductTableModel] = []
    
    var segmentControlSelectIndex: Int = 0
    
    var segmentedControlView: BetterSegmentedControl = BetterSegmentedControl(frame: CGRect(x: 0,
                                                                                            y: 0,
                                                                                                         width:0,
                                                                                                         height:0))
    
    var segmentControlWidth: CGFloat = 0
    
    lazy var viewModel: ProductInfoProtocol = {
        let vm = ProductInfoViewModel(vc: self)
        self.configure(vm)
        self.bindToViewModel()
        return vm
    }()
    
    //Begin Value
    
    @IBOutlet weak var esPnValue: UILabel!
    @IBOutlet weak var mfrPnValue: UILabel!
    @IBOutlet weak var menufacturerValue: UILabel!
    @IBOutlet weak var invoiceDescriptionValue: UILabel!
    @IBOutlet weak var productDescriptionValue: UILabel!
    
    @IBOutlet weak var dataSheetValue: UILabel!
    @IBOutlet weak var brochureValue: UILabel!
    
    @IBOutlet weak var posterImageValue: UIImageView!
    
    //End Value
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        mockData()
        
        setupImageCollection()
        setupPriceTableView()
        setupInventoryTableView()
        setupShipmentTableView()
        setupSimilarRelatedTableView()
        
        NotificationCenter.default.addObserver(self, selector: #selector(rotated), name: UIDevice.orientationDidChangeNotification, object: nil)
        
        segmentControlWidth = self.headerSegmentControlProductView.frame.width
        
        
        viewModel.input.fetchData()
    }
    
    func configure(_ interface: ProductInfoProtocol) {
        self.viewModel = interface
    }
    
    deinit {
       NotificationCenter.default.removeObserver(self, name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupSegmentControlProductView()
    }
    
    override func viewWillLayoutSubviews() {
//        productTableView.reloadData()
    }
    
    @objc func rotated() {
        DispatchQueue.main.async {
            self.setupSegmentControlProductView()
        }
    }
    
    func mockData(){
        
        //listPriceTable Test
//        listPriceTable.append(PriceTableModel(qyt: 1, unitPrice: "XXX,XXX.XX"))
        
        //listInventoryTable Test
//        listInventoryTable.append(InventoryTableModel(key: "A", location: "RET.SHOP-BANMOH", onhand: "XXX,XXX", booking: "XXX,XXX", balance: "XXX,XXX"))
        
        //listShipmentTable
//        listShipmentTable.append(ShipmentTableModel(poNo: "xxxxx", item: "xx", poDate: "xx/xx/xx", qtyAvl: "xxx,xxx", estArr: "xx/xx/xx", conArr: "xx/xx/xx", increase: "xx %", approve: "Approve"))
        
        //listProductInformation
//        listProductInformation.append(ProductTableModel(title: "Instrument Type", value: "Thermal Image"))

        
        //listProductSpecification
//        listProductSpecification.append(ProductTableModel(title: "Instrument Type", value: "XXXXXX"))
        
        //listSimilarTable
//        listSimilarTable.append(SimilarTableModel(image: "", title: "XXXXXXXXX", type: "XXXXXXXXXXXX", desc: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", price: "X,XXX"))
    }
}

// MARK: - Binding
extension ProductInfoViewController {
    
    func bindToViewModel() {
        viewModel.output.didGetProductInfo2Success = didGetProductInfo2Success()
        viewModel.output.didGetProductInfo2Error = didGetProductInfo2Error()
        
        viewModel.output.didGetProductInfo3Success = didGetProductInfo3Success()
        viewModel.output.didGetProductInfo3Error = didGetProductInfo3Error()
        
        viewModel.output.didGetSimilarPartSuccess = didGetSimilarPartSuccess()
        viewModel.output.didGetSimilarPartError = didGetSimilarPartError()
        
        viewModel.output.didGetRelatedPartSuccess = didGetRelatedPartSuccess()
        viewModel.output.didGetRelatedPartError = didGetRelatedPartError()
    }
    
    func didGetProductInfo2Success() -> (() -> Void) {
        return { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.setupValueInfo2()
        }
    }
    
    func didGetProductInfo2Error() -> (() -> Void) {
        return { [weak self] in
            guard let weakSelf = self else { return }
        }
    }
    
    func didGetProductInfo3Success() -> (() -> Void) {
        return { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.setupValueInfo3()
        }
    }
    
    func didGetProductInfo3Error() -> (() -> Void) {
        return { [weak self] in
            guard let weakSelf = self else { return }
        }
    }
    
    func didGetSimilarPartSuccess() -> (() -> Void) {
        return { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.similarTableView.reloadData()
        }
    }
    
    func didGetSimilarPartError() -> (() -> Void) {
        return { [weak self] in
            guard let weakSelf = self else { return }
        }
    }
    
    func didGetRelatedPartSuccess() -> (() -> Void) {
        return { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.relatedTableView.reloadData()
        }
    }
    
    func didGetRelatedPartError() -> (() -> Void) {
        return { [weak self] in
            guard let weakSelf = self else { return }
        }
    }
    
}

extension ProductInfoViewController {
    
    func setupValueInfo2() {
        guard let item = viewModel.output.getDataProductInfo2() else { return }
        esPnValue.text = item.ES_PN ?? ""
        mfrPnValue.text = item.MFR_PN ?? ""
        menufacturerValue.text = item.MANUFACTURER ?? ""
        invoiceDescriptionValue.text = item.INVOICE_DESCRIPTION ?? ""
        productDescriptionValue.text = "\(item.PRODUCT_DESCRIPTION1 ?? "" )\n\(item.PRODUCT_DESCRIPTION2 ?? "")\n\(item.PRODUCT_DESCRIPTION3 ?? "")"
        
        
        if let urlImage = URL(string: "\(DomainNameConfig.ImagePath.urlString)\(item.PICTURE ?? "").jpg") {
            posterImageValue.kf.setImageDefault(with: urlImage)
        }
        
        //Data Sheet
        dataSheetValue.text = item.DATASHEET ?? ""
        let tapPDF = UITapGestureRecognizer(target: self, action: #selector(self.handleTapViewPDF(_:)))
        dataSheetValue.addGestureRecognizer(tapPDF)
        dataSheetValue.isUserInteractionEnabled = true
        brochureValue.text = item.BROCHURE ?? ""
        
        priceTableView.reloadData()
        inventoryTableView.reloadData()
        
        pricePerUnitValue.text = "Price Per unit : \(item.UNIT ?? "")"
        priceVatValue.text = "Price not include VAT \(item.VATSTATUS ?? "0")%"
        
        setValueProductInfo()
        setValueProductSpec()
    }
    
    @objc func handleTapViewPDF(_ sender: UITapGestureRecognizer? = nil) {
        guard let item = viewModel.output.getDataProductInfo2(), let pdfName = item.DATASHEET else { return }
        if let url = URL(string: "\(DomainNameConfig.PDFPath.urlString)\(pdfName)") {
            UIApplication.shared.open(url)
        }
    }
    
    private func setValueProductInfo() {
        guard let item = viewModel.output.getDataProductInfo2() else { return }
        listProductInformation.append(ProductTableModel(title: item.ProdSpecHead1 ?? "", value: item.ProdSpecDetail1 ?? ""))
        listProductInformation.append(ProductTableModel(title: item.ProdSpecHead2 ?? "", value: item.ProdSpecDetail2 ?? ""))
        listProductInformation.append(ProductTableModel(title: item.ProdSpecHead3 ?? "", value: item.ProdSpecDetail3 ?? ""))
        listProductInformation.append(ProductTableModel(title: item.ProdSpecHead4 ?? "", value: item.ProdSpecDetail4 ?? ""))
        listProductInformation.append(ProductTableModel(title: item.ProdSpecHead5 ?? "", value: item.ProdSpecDetail5 ?? ""))
        listProductInformation.append(ProductTableModel(title: item.ProdSpecHead6 ?? "", value: item.ProdSpecDetail6 ?? ""))
        listProductInformation.append(ProductTableModel(title: item.ProdSpecHead7 ?? "", value: item.ProdSpecDetail7 ?? ""))
        listProductInformation.append(ProductTableModel(title: item.ProdSpecHead8 ?? "", value: item.ProdSpecDetail8 ?? ""))
        listProductInformation.append(ProductTableModel(title: item.ProdSpecHead9 ?? "", value: item.ProdSpecDetail9 ?? ""))
        listProductInformation.append(ProductTableModel(title: item.ProdSpecHead10 ?? "", value: item.ProdSpecDetail10 ?? ""))
        listProductInformation.append(ProductTableModel(title: item.ProdSpecHead11 ?? "", value: item.ProdSpecDetail11 ?? ""))
        listProductInformation.append(ProductTableModel(title: item.ProdSpecHead12 ?? "", value: item.ProdSpecDetail12 ?? ""))
        listProductInformation.append(ProductTableModel(title: item.ProdSpecHead13 ?? "", value: item.ProdSpecDetail13 ?? ""))
        listProductInformation.append(ProductTableModel(title: item.ProdSpecHead14 ?? "", value: item.ProdSpecDetail14 ?? ""))
        listProductInformation.append(ProductTableModel(title: item.ProdSpecHead15 ?? "", value: item.ProdSpecDetail15 ?? ""))
        productTableView.reloadData()
    }
    
    private func setValueProductSpec() {
        guard let item = viewModel.output.getDataProductInfo2() else { return }

        listProductSpecification.append(ProductTableModel(title: "Product Category", value: "\(item.PRODUCT_CATEGORY ?? "")"))
        listProductSpecification.append(ProductTableModel(title: "Family", value: "\(item.FAMILY ?? "")"))
        listProductSpecification.append(ProductTableModel(title: "Product Part No.", value: "\(item.PRODUCT_PART_NO ?? "")"))
        listProductSpecification.append(ProductTableModel(title: "ES Part No.", value: "\(item.ES_PART_NO ?? "")"))
        listProductSpecification.append(ProductTableModel(title: "Manufacturer", value: "\(item.MANUFACTURER ?? "")"))
        listProductSpecification.append(ProductTableModel(title: "Package/Case", value: "\(item.PACKAGE_CASE ?? "")"))
        listProductSpecification.append(ProductTableModel(title: "Mfr Package", value: "\(item.MFR_PACKAGE ?? "")"))
        listProductSpecification.append(ProductTableModel(title: "Packaging", value: "\(item.PACKAGING ?? "")"))
        listProductSpecification.append(ProductTableModel(title: "Qty/Packaging", value: "\(item.QTY_PACKAGING ?? "")"))
        listProductSpecification.append(ProductTableModel(title: "Mfr_Std_pack", value: "\(item.MFR_STD_PACK ?? 0)"))
        listProductSpecification.append(ProductTableModel(title: "ES_Std_pack", value: "\(item.ES_STD_PACK ?? 0)"))
        listProductSpecification.append(ProductTableModel(title: "Unit", value: "\(item.UNIT ?? "")"))
        listProductSpecification.append(ProductTableModel(title: "Weight(Gram)", value: "\(item.WEIGHT ?? 0)"))
        listProductSpecification.append(ProductTableModel(title: "Warranty(year)", value: "\(item.Warranty ?? 0)"))
        listProductSpecification.append(ProductTableModel(title: "PB Free", value: "\(item.PBFREE ?? "")"))
        listProductSpecification.append(ProductTableModel(title: "RoHS", value: "\(item.ROHS ?? "")"))
        productTableView.reloadData()
        
    }
    
    private func setupValueInfo3() {
        let data = viewModel.output.getDataProductInfo3()
        listShipmentTable.removeAll()
        data.forEach({ item in
            let poDate = item.PO_DATE?.convertToDate()?.getFormattedDate(format: "dd/MM/yyyy") ?? ""
            let estArr = item.EST_ARR?.convertToDate()?.getFormattedDate(format: "dd/MM/yyyy") ?? ""
            let conArr = item.CON_ARR?.convertToDate()?.getFormattedDate(format: "dd/MM/yyyy") ?? ""
            let model = ShipmentTableModel(poNo: "\(item.PO_NO ?? 0)", item: "\(item.ITEM ?? 0)", poDate: "\(poDate)", qtyAvl: "\(item.QTY_AVL ?? 0)", estArr: "\(estArr)", conArr: "\(conArr)")
            listShipmentTable.append(model)
        })
        shipmentTableView.reloadData()
    }
}

extension ProductInfoViewController {
    func setupUI() {
        navigationItem.title = "Product Information"
        
//        let menuRight = UIBarButtonItem()
//        menuRight.target = self
//        menuRight.action = #selector(dismissTapped)
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
    
    func setupImageCollection() {
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
        let nib = UINib(nibName: imageCollectionViewCellId, bundle: nil)
        imageCollectionView?.register(nib, forCellWithReuseIdentifier: imageCollectionViewCellId)
        if let flowLayout = self.imageCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
    }
    
    func setupPriceTableView() {
        priceTableView.delegate = self
        priceTableView.dataSource = self
        let headerNib = UINib.init(nibName: "PriceHeaderTableViewCell", bundle: Bundle.main)
        priceTableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "PriceHeaderTableViewCell")
        priceTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        priceTableView.separatorStyle = .none
        let priceNib = UINib.init(nibName: "PriceListTableViewCell", bundle: Bundle.main)
        priceTableView.register(priceNib, forCellReuseIdentifier: "PriceListTableViewCell")
    }
    
    func setupInventoryTableView() {
        inventoryTableView.delegate = self
        inventoryTableView.dataSource = self
        inventoryTableView.backgroundView?.backgroundColor = .white
        inventoryTableView.backgroundColor = .white
        inventoryTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        inventoryTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        inventoryTableView.separatorStyle = .none
        
        let headerNib = UINib.init(nibName: "InventoryHeaderTableViewCell", bundle: Bundle.main)
        inventoryTableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "InventoryHeaderTableViewCell")
        
        let inventoryNib = UINib.init(nibName: "InventoryListTableViewCell", bundle: Bundle.main)
        inventoryTableView.register(inventoryNib, forCellReuseIdentifier: "InventoryListTableViewCell")
        
        
        let footerNib = UINib.init(nibName: "InventoryFooterTableViewCell", bundle: Bundle.main)
        inventoryTableView.register(footerNib, forHeaderFooterViewReuseIdentifier: "InventoryFooterTableViewCell")
    }
    
    func setupShipmentTableView() {
        shipmentTableView.delegate = self
        shipmentTableView.dataSource = self
        shipmentTableView.backgroundView?.backgroundColor = .white
        shipmentTableView.backgroundColor = .white
        shipmentTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        shipmentTableView.separatorStyle = .none
        shipmentTableView.separatorColor = .clear
        
        let headerNib = UINib.init(nibName: "ShipmentHeaderTableViewCell", bundle: Bundle.main)
        shipmentTableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "ShipmentHeaderTableViewCell")
        
        let shipmentNib = UINib.init(nibName: "ShipmentListTableViewCell", bundle: Bundle.main)
        shipmentTableView.register(shipmentNib, forCellReuseIdentifier: "ShipmentListTableViewCell")
    }
    
    func setupProductTableView() {
        productTableView.delegate = self
        productTableView.dataSource = self
        productTableView.backgroundView?.backgroundColor = .white
        productTableView.backgroundColor = .white
        productTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        productTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        productTableView.separatorStyle = .none
        productTableView.separatorColor = .clear
        
        let productInfoNib = UINib.init(nibName: "ProductInformationTableViewCell", bundle: Bundle.main)
        productTableView.register(productInfoNib, forCellReuseIdentifier: "ProductInformationTableViewCell")
        let productSpecNib = UINib.init(nibName: "ProductSpecificationTableViewCell", bundle: Bundle.main)
        productTableView.register(productSpecNib, forCellReuseIdentifier: "ProductSpecificationTableViewCell")
        
        viewTopProduct.roundCorners(corners: [.topLeft, .topRight], radius: 8.0)
    }
    
    func setupSegmentControlProductView() {
        segmentedControlView = BetterSegmentedControl(frame: CGRect(x: 0,
                                                           y: 0,
                                                                        width: self.headerSegmentControlProductView.frame.width,
                                                                        height: self.headerSegmentControlProductView.frame.height))
        
        segmentedControlView.segments = LabelSegment.segments(withTitles: ["PRODUCT INFORMATION", "PRODUCT SPECIFICATION"], numberOfLines: 1, normalBackgroundColor: .white, normalFont: UIFont.init(name: "supermarket", size: 19), normalTextColor: UIColor.init(named: "NewPrimary"), selectedBackgroundColor: UIColor.init(named: "NewPrimary"), selectedFont: UIFont.init(name: "supermarket", size: 19), selectedTextColor: .white)
        segmentedControlView.cornerRadius = 8
        segmentedControlView.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        headerSegmentControlProductView.setRounded(rounded: 8)
        
        for view in self.headerSegmentControlProductView.subviews {
            view.removeFromSuperview()
        }
        
        headerSegmentControlProductView.addSubview(segmentedControlView)
        
        segmentedControlView.setIndex(segmentControlSelectIndex)
        
        setupProductTableView()
    }
    
    @objc func segmentedControlValueChanged(_ sender: BetterSegmentedControl) {
        segmentControlSelectIndex = sender.index
        DispatchQueue.main.async {
            self.productTableView.reloadData()
        }
    }
    
    
    func setupSimilarRelatedTableView() {
        similarTableView.delegate = self
        similarTableView.dataSource = self
        similarTableView.backgroundView?.backgroundColor = .white
        similarTableView.backgroundColor = .white
        similarTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        similarTableView.separatorStyle = .none
        similarTableView.separatorColor = .clear
        
        let headerNib = UINib.init(nibName: "SimilarRelatedHeaderTableViewCell", bundle: Bundle.main)
        similarTableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "SimilarRelatedHeaderTableViewCell")
        
        let similarNib = UINib.init(nibName: "SimilarRelatedListTableViewCell", bundle: Bundle.main)
        similarTableView.register(similarNib, forCellReuseIdentifier: "SimilarRelatedListTableViewCell")
        
        
        relatedTableView.delegate = self
        relatedTableView.dataSource = self
        relatedTableView.backgroundView?.backgroundColor = .white
        relatedTableView.backgroundColor = .white
        relatedTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        relatedTableView.separatorStyle = .none
        relatedTableView.separatorColor = .clear
        relatedTableView.register(headerNib, forHeaderFooterViewReuseIdentifier: "SimilarRelatedHeaderTableViewCell")
        relatedTableView.register(similarNib, forCellReuseIdentifier: "SimilarRelatedListTableViewCell")
    }
    
    @objc func menuTapped() {
        
    }
    
    @objc func dismissTapped() {
        debugPrint("dismissTapped")
        self.navigationController?.popViewController(animated: true)
    }
}

extension ProductInfoViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset:CGFloat = 0
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 75, height: 75)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: imageCollectionViewCellId, for: indexPath) as! ImageCollectionViewCell
        cell.configure()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.row)")
    }
}


extension ProductInfoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch tableView {
        case priceTableView:
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "PriceHeaderTableViewCell") as! PriceHeaderTableViewCell
            return headerView
        case inventoryTableView:
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "InventoryHeaderTableViewCell") as! InventoryHeaderTableViewCell
            return headerView
        case shipmentTableView:
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ShipmentHeaderTableViewCell") as! ShipmentHeaderTableViewCell
            return headerView
        case similarTableView:
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "SimilarRelatedHeaderTableViewCell") as! SimilarRelatedHeaderTableViewCell
            headerView.title = "SIMILAR PART"
            return headerView
        case relatedTableView:
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "SimilarRelatedHeaderTableViewCell") as! SimilarRelatedHeaderTableViewCell
            headerView.title = "RELATED PART"
            return headerView
        default:
            return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        switch tableView {
        case inventoryTableView:
            let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "InventoryFooterTableViewCell") as! InventoryFooterTableViewCell
//            footerView.backgroundColor = .red
            let value = viewModel.output.getDataInventoryFooter()
            footerView.onhand = value.0
            footerView.booking = value.1
            footerView.balance = value.2
            return footerView
        default:
            return UIView()
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        switch tableView {
        case productTableView:
            return 0
        case similarTableView, relatedTableView:
            return 60
        case inventoryTableView:
            return 30
        default:
            return 30
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        switch tableView {
        case inventoryTableView:
            return 50
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case priceTableView:
            return viewModel.output.getDataTablePrice().count
        case inventoryTableView:
            let count = viewModel.output.getDataInventoryTable().count
            inventoryTableViewHeight.constant = CGFloat(((count) * 30) + 50 + 30)
            return count
        case shipmentTableView:
            let count = viewModel.output.getDataProductInfo3().count
            shipmentTableViewHeight.constant = CGFloat(((count) * 30) + 30)
            return count
        case productTableView:
            switch segmentControlSelectIndex {
            case 0:
                viewProductHeight.constant = CGFloat(listProductInformation.count * 30) + 36
                return listProductInformation.count
            case 1:
                viewProductHeight.constant = CGFloat(listProductSpecification.count * 30) + 36
                return listProductSpecification.count
            default:
                return listProductSpecification.count
            }
            
            
        case similarTableView:
            let count = viewModel.output.getDataSimilarPart().count
            if viewModel.output.getDataSimilarPart().count >= viewModel.output.getDataRelatedPart().count {
                similarTableViewHeight.constant = CGFloat((count * 200) + 60)
                relatedTableViewHeight.constant = CGFloat((count * 200) + 60)
            }
            return count
        case relatedTableView:
            let count = viewModel.output.getDataRelatedPart().count
            if viewModel.output.getDataRelatedPart().count >= viewModel.output.getDataSimilarPart().count {
                similarTableViewHeight.constant = CGFloat((count * 200) + 60)
                relatedTableViewHeight.constant = CGFloat((count * 200) + 60)
            }
            return count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            switch tableView {
            case priceTableView:
                let cell = tableView.dequeueReusableCell(withIdentifier: "PriceListTableViewCell", for: indexPath) as! PriceListTableViewCell
                let item = viewModel.output.getDataTablePrice()
                cell.item = item[indexPath.item]
                return cell
            case inventoryTableView:
                let cell = tableView.dequeueReusableCell(withIdentifier: "InventoryListTableViewCell", for: indexPath) as! InventoryListTableViewCell
                let item = viewModel.output.getDataInventoryTable()
                cell.item = item[indexPath.item]
                if indexPath.item % 2 == 0 {
                    cell.backgroundColor = UIColor.clear
                }else {
                    if #available(iOS 13.0, *) {
                        cell.backgroundColor = UIColor.systemGray5
                    } else {
                        // Fallback on earlier versions
                        cell.backgroundColor = UIColor(red: 229.0, green: 229.0, blue: 234.0, alpha: 1.0)
                    }
                }
                cell.selectionStyle = .none
                return cell
            case shipmentTableView:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ShipmentListTableViewCell", for: indexPath) as! ShipmentListTableViewCell
                cell.data = listShipmentTable[indexPath.item]
                cell.backgroundColor = UIColor.clear
                cell.selectionStyle = .none
                return cell
            case productTableView:
                switch segmentControlSelectIndex {
                case 0:
                    let cell = tableView.dequeueReusableCell(withIdentifier: "ProductInformationTableViewCell", for: indexPath) as! ProductInformationTableViewCell
                    cell.item = listProductInformation[indexPath.item]
                    cell.backgroundColor = UIColor.clear
                    cell.selectionStyle = .none
                    return cell
                default:
                    let cell = tableView.dequeueReusableCell(withIdentifier: "ProductSpecificationTableViewCell", for: indexPath) as! ProductSpecificationTableViewCell
                    cell.item = listProductSpecification[indexPath.item]
                    cell.backgroundColor = UIColor.clear
                    cell.selectionStyle = .none
                    return cell
                }
            case similarTableView, relatedTableView:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SimilarRelatedListTableViewCell", for: indexPath) as! SimilarRelatedListTableViewCell
                cell.data = viewModel.output.getDataSimilarPart()[indexPath.item]
                cell.backgroundColor = UIColor.clear
                cell.selectionStyle = .none
                return cell
            case relatedTableView:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SimilarRelatedListTableViewCell", for: indexPath) as! SimilarRelatedListTableViewCell
                cell.data = viewModel.output.getDataRelatedPart()[indexPath.item]
                cell.backgroundColor = UIColor.clear
                cell.selectionStyle = .none
                return cell
            default:
                return UITableViewCell()
            }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch tableView {
        case priceTableView, inventoryTableView, shipmentTableView, productTableView:
            return 30
        case similarTableView, relatedTableView:
            return 200
        default:
            return 44
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(indexPath.item)
    }
}
