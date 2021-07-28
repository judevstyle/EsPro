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
    @IBOutlet weak var productTableViewHeight: NSLayoutConstraint!
    
    
    //similar & related
    @IBOutlet weak var similarTableView: UITableView!
    @IBOutlet weak var similarTableViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var relatedTableView: UITableView!
    @IBOutlet weak var relatedTableViewHeight: NSLayoutConstraint!
    
    var listPriceTable: [PriceTableModel] = []
    var listInventoryTable: [InventoryTableModel] = []
    var listShipmentTable: [ShipmentTableModel] = []
    
    var listProductInformation: [ProductTableModel] = []
    var listProductSpecification: [ProductTableModel] = []
    
    var listSimilarTable: [SimilarTableModel] = []
    var listRelatedTable: [SimilarTableModel] = []
    
    var segmentControlSelectIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        mockData()
        
        setupImageCollection()
        setupPriceTableView()
        setupInventoryTableView()
        setupShipmentTableView()
        setupProductTableView()
        setupSimilarRelatedTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.backItem?.title = ""
        setupSegmentControlProductView()
    }
    
    func mockData(){
        
        //listPriceTable
        listPriceTable.append(PriceTableModel(qyt: 1, unitPrice: "XXX,XXX.XX"))
        listPriceTable.append(PriceTableModel(qyt: 10, unitPrice: "XXX,XXX.XX"))
        listPriceTable.append(PriceTableModel(qyt: 50, unitPrice: "XXX,XXX.XX"))
        listPriceTable.append(PriceTableModel(qyt: 100, unitPrice: "XXX,XXX.XX"))
        listPriceTable.append(PriceTableModel(qyt: 500, unitPrice: "XXX,XXX.XX"))
        listPriceTable.append(PriceTableModel(qyt: 1000, unitPrice: "XXX,XXX.XX"))
        
        //listInventoryTable
        listInventoryTable.append(InventoryTableModel(key: "A", location: "RET.SHOP-BANMOH", onhand: "XXX,XXX", booking: "XXX,XXX", balance: "XXX,XXX"))
        listInventoryTable.append(InventoryTableModel(key: "B", location: "", onhand: "", booking: "", balance: ""))
        listInventoryTable.append(InventoryTableModel(key: "C", location: "", onhand: "", booking: "", balance: ""))
        listInventoryTable.append(InventoryTableModel(key: "D", location: "", onhand: "", booking: "", balance: ""))
        listInventoryTable.append(InventoryTableModel(key: "E", location: "", onhand: "", booking: "", balance: ""))
        listInventoryTable.append(InventoryTableModel(key: "F", location: "", onhand: "", booking: "", balance: ""))
        listInventoryTable.append(InventoryTableModel(key: "G", location: "", onhand: "", booking: "", balance: ""))
        listInventoryTable.append(InventoryTableModel(key: "H", location: "", onhand: "", booking: "", balance: ""))
        listInventoryTable.append(InventoryTableModel(key: "I", location: "", onhand: "", booking: "", balance: ""))
        listInventoryTable.append(InventoryTableModel(key: "J", location: "", onhand: "", booking: "", balance: ""))
        listInventoryTable.append(InventoryTableModel(key: "K", location: "", onhand: "", booking: "", balance: ""))
        listInventoryTable.append(InventoryTableModel(key: "L", location: "WH-B.HARMONY", onhand: "XXX,XXX", booking: "XXX,XXX", balance: "XXX,XXX"))
        listInventoryTable.append(InventoryTableModel(key: "M", location: "", onhand: "", booking: "", balance: ""))
        listInventoryTable.append(InventoryTableModel(key: "N", location: "", onhand: "", booking: "", balance: ""))
        
        //listShipmentTable
        listShipmentTable.append(ShipmentTableModel(poNo: "xxxxx", item: "xx", poDate: "xx/xx/xx", qtyAvl: "xxx,xxx", estArr: "xx/xx/xx", conArr: "xx/xx/xx", increase: "xx %", approve: "Approve"))
        listShipmentTable.append(ShipmentTableModel(poNo: "xxxxx", item: "xx", poDate: "xx/xx/xx", qtyAvl: "xxx,xxx", estArr: "xx/xx/xx", conArr: "xx/xx/xx", increase: "xx %", approve: "Approve"))
        listShipmentTable.append(ShipmentTableModel(poNo: "xxxxx", item: "xx", poDate: "xx/xx/xx", qtyAvl: "xxx,xxx", estArr: "xx/xx/xx", conArr: "xx/xx/xx", increase: "xx %", approve: "Approve"))
        listShipmentTable.append(ShipmentTableModel(poNo: "xxxxx", item: "xx", poDate: "xx/xx/xx", qtyAvl: "xxx,xxx", estArr: "xx/xx/xx", conArr: "xx/xx/xx", increase: "xx %", approve: "Approve"))
        listShipmentTable.append(ShipmentTableModel(poNo: "xxxxx", item: "xx", poDate: "xx/xx/xx", qtyAvl: "xxx,xxx", estArr: "xx/xx/xx", conArr: "xx/xx/xx", increase: "xx %", approve: "Approve"))
        listShipmentTable.append(ShipmentTableModel(poNo: "xxxxx", item: "xx", poDate: "xx/xx/xx", qtyAvl: "xxx,xxx", estArr: "xx/xx/xx", conArr: "xx/xx/xx", increase: "xx %", approve: "Approve"))
        
        
        //listProductInformation
        listProductInformation.append(ProductTableModel(title: "Instrument Type", value: "Thermal Image"))
        listProductInformation.append(ProductTableModel(title: "Measurement Methods", value: "Non Contact - Infrared Camera"))
        listProductInformation.append(ProductTableModel(title: "Series", value: "DT9875Y"))
        listProductInformation.append(ProductTableModel(title: "Temperature", value: "Hight Temperature"))
        listProductInformation.append(ProductTableModel(title: "Instrument Type", value: "XXXXXX"))
        listProductInformation.append(ProductTableModel(title: "Instrument Type", value: "XXXXXX"))
        listProductInformation.append(ProductTableModel(title: "Instrument Type", value: "XXXXXX"))
        listProductInformation.append(ProductTableModel(title: "Instrument Type", value: "XXXXXX"))
        
        //listProductSpecification
        listProductSpecification.append(ProductTableModel(title: "Instrument Type", value: "XXXXXX"))
        listProductSpecification.append(ProductTableModel(title: "Instrument Type", value: "XXXXXX"))
        listProductSpecification.append(ProductTableModel(title: "Instrument Type", value: "XXXXXX"))
        listProductSpecification.append(ProductTableModel(title: "Instrument Type", value: "XXXXXX"))
        listProductSpecification.append(ProductTableModel(title: "Instrument Type", value: "XXXXXX"))
        listProductSpecification.append(ProductTableModel(title: "Instrument Type", value: "XXXXXX"))
        listProductSpecification.append(ProductTableModel(title: "Instrument Type", value: "XXXXXX"))
        listProductSpecification.append(ProductTableModel(title: "Instrument Type", value: "XXXXXX"))
        listProductSpecification.append(ProductTableModel(title: "Instrument Type", value: "XXXXXX"))
        listProductSpecification.append(ProductTableModel(title: "Instrument Type", value: "XXXXXX"))
        listProductSpecification.append(ProductTableModel(title: "Instrument Type", value: "XXXXXX"))
        listProductSpecification.append(ProductTableModel(title: "Instrument Type", value: "XXXXXX"))
        
        //listSimilarTable
        listSimilarTable.append(SimilarTableModel(image: "", title: "XXXXXXXXX", type: "XXXXXXXXXXXX", desc: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", price: "X,XXX"))
        listSimilarTable.append(SimilarTableModel(image: "", title: "XXXXXXXXX", type: "XXXXXXXXXXXX", desc: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", price: "X,XXX"))
        listSimilarTable.append(SimilarTableModel(image: "", title: "XXXXXXXXX", type: "XXXXXXXXXXXX", desc: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", price: "X,XXX"))
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
        
        let backLeft = UIBarButtonItem()
        backLeft.target = self
        backLeft.action = #selector(dismissTapped)
        backLeft.image = UIImage(systemName: "arrow.left")?.withRenderingMode(.alwaysTemplate)
        backLeft.tintColor = .darkGray
        navigationItem.leftBarButtonItem = backLeft
        
        
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
        productTableView.separatorStyle = .none
        productTableView.separatorColor = .clear
        
        let productInfoNib = UINib.init(nibName: "ProductInformationTableViewCell", bundle: Bundle.main)
        productTableView.register(productInfoNib, forCellReuseIdentifier: "ProductInformationTableViewCell")
        let productSpecNib = UINib.init(nibName: "ProductSpecificationTableViewCell", bundle: Bundle.main)
        productTableView.register(productSpecNib, forCellReuseIdentifier: "ProductSpecificationTableViewCell")
    }
    
    func setupSegmentControlProductView() {
        let control = BetterSegmentedControl(frame: CGRect(x: 0,
                                                           y: 0,
                                                           width: headerSegmentControlProductView.frame.width,
                                                           height: headerSegmentControlProductView.frame.height))
        control.segments = LabelSegment.segments(withTitles: ["PRODUCT INFORMATION", "PRODUCT SPECIFICATION"], numberOfLines: 1, normalBackgroundColor: .white, normalFont: UIFont.init(name: "supermarket", size: 19), normalTextColor: UIColor.init(named: "NewPrimary"), selectedBackgroundColor: UIColor.init(named: "NewPrimary"), selectedFont: UIFont.init(name: "supermarket", size: 19), selectedTextColor: .white)
        control.cornerRadius = 8
        control.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        headerSegmentControlProductView.setRounded(rounded: 8)
        headerSegmentControlProductView.addSubview(control)
        
    }
    
    @objc func segmentedControlValueChanged(_ sender: BetterSegmentedControl) {
        segmentControlSelectIndex = sender.index
        productTableView.reloadData()
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
        return 10
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
        case similarTableView, relatedTableView:
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "SimilarRelatedHeaderTableViewCell") as! SimilarRelatedHeaderTableViewCell
            return headerView
        default:
            return UITableViewHeaderFooterView()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        switch tableView {
        case inventoryTableView:
            let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "InventoryFooterTableViewCell") as! InventoryFooterTableViewCell
            footerView.backgroundColor = .red
            return footerView
        default:
            return nil
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        switch tableView {
        case productTableView:
            return 0
        case similarTableView, relatedTableView:
            return 60
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
            return listPriceTable.count
        case inventoryTableView:
            inventoryTableViewHeight.constant = CGFloat(((listInventoryTable.count) * 30) + 50 + 30)
            return listInventoryTable.count
        case shipmentTableView:
            shipmentTableViewHeight.constant = CGFloat(((listShipmentTable.count ) * 30) + 30)
            return listShipmentTable.count
        case productTableView:
            switch segmentControlSelectIndex {
            case 0:
                productTableViewHeight.constant = CGFloat(listProductInformation.count * 30)
                return listProductInformation.count
            default:
                productTableViewHeight.constant = CGFloat(listProductSpecification.count * 30)
                return listProductSpecification.count
            }
        case similarTableView, relatedTableView:
            similarTableViewHeight.constant = CGFloat((listSimilarTable.count * 200) + 60)
            relatedTableViewHeight.constant = CGFloat((listSimilarTable.count * 200) + 60)
            return listSimilarTable.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            switch tableView {
            case priceTableView:
                let cell = tableView.dequeueReusableCell(withIdentifier: "PriceListTableViewCell", for: indexPath) as! PriceListTableViewCell
                cell.item = listPriceTable[indexPath.item]
                return cell
            case inventoryTableView:
                let cell = tableView.dequeueReusableCell(withIdentifier: "InventoryListTableViewCell", for: indexPath) as! InventoryListTableViewCell
                cell.item = listInventoryTable[indexPath.item]
                if indexPath.item % 2 == 0 {
                    cell.backgroundColor = UIColor.clear
                }else {
                    cell.backgroundColor = UIColor.systemGray5
                }
                return cell
            case shipmentTableView:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ShipmentListTableViewCell", for: indexPath) as! ShipmentListTableViewCell
                cell.data = listShipmentTable[indexPath.item]
                cell.backgroundColor = UIColor.clear
                return cell
            case productTableView:
                switch segmentControlSelectIndex {
                case 0:
                    let cell = tableView.dequeueReusableCell(withIdentifier: "ProductInformationTableViewCell", for: indexPath) as! ProductInformationTableViewCell
                    cell.item = listProductInformation[indexPath.item]
                    cell.backgroundColor = UIColor.clear
                    return cell
                default:
                    let cell = tableView.dequeueReusableCell(withIdentifier: "ProductSpecificationTableViewCell", for: indexPath) as! ProductSpecificationTableViewCell
                    cell.item = listProductSpecification[indexPath.item]
                    cell.backgroundColor = UIColor.clear
                    return cell
                }
            case similarTableView, relatedTableView:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SimilarRelatedListTableViewCell", for: indexPath) as! SimilarRelatedListTableViewCell
//                cell.item = listProductSpecification[indexPath.item]
                cell.backgroundColor = UIColor.clear
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
        print(indexPath.item)
    }
}
