//
//  ProductInfoViewController.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 17/4/2564 BE.
//

import UIKit

class ProductInfoViewController: UIViewController {
    
    @IBOutlet var imageCollectionView: UICollectionView!
    private let imageCollectionViewCellId: String = "ImageCollectionViewCell"
    
    @IBOutlet var priceTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupImageCollection()
        setupPriceTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.backItem?.title = ""
    }
}

extension ProductInfoViewController {
    func setupUI() {
        navigationItem.title = "Product Information"
        
        let menuRight = UIBarButtonItem()
        menuRight.action = #selector(menuTapped)
        menuRight.image = UIImage(named: "menu")?.withRenderingMode(.alwaysTemplate)
        menuRight.tintColor = .black
        navigationItem.rightBarButtonItem = menuRight
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
    }
    
    @objc func menuTapped() {
        
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
//        let product = products[indexPath.row]
        print("\(indexPath.row)")
    }
}

extension ProductInfoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "PriceHeaderTableViewCell") as! PriceHeaderTableViewCell
        return headerView
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cellDataList", for: indexPath) as! DataListViewCell
//        cell.selectionStyle = .gray
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.item)
    }
}
