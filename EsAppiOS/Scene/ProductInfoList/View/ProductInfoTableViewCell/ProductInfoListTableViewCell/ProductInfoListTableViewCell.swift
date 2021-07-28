//
//  ProductInfoListTableViewCell.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 5/4/21.
//

import UIKit

class ProductInfoListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var esPn: UILabel!
    @IBOutlet weak var mfrPn: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var qty: UILabel!
    @IBOutlet weak var price1: UILabel!
    
    
    @IBOutlet var esPnView: UIView!
    @IBOutlet var mfrPnView: UIView!
    @IBOutlet var descView: UIView!
    @IBOutlet var qtyView: UIView!
    @IBOutlet var priceView: UIView!
    
    
    var data : String? {
        didSet {
            setupValue()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func setupUI() {
        
        esPnView.useUnderline()
        mfrPnView.useUnderline()
        descView.useUnderline()
        qtyView.useUnderline()
        priceView.useUnderline()
        
//        esPnView.addLeftBorder(with: UIColor.gray, andWidth: 0.5)
        esPnView.addRightBorder(with: UIColor.gray, andWidth: 0.5)
        mfrPnView.addRightBorder(with: UIColor.gray, andWidth: 0.5)
        descView.addRightBorder(with: UIColor.gray, andWidth: 0.5)
        qtyView.addRightBorder(with: UIColor.gray, andWidth: 0.5)
//        priceView.addRightBorder(with: UIColor.gray, andWidth: 0.5)
    }
    
    func setupValue() {
        esPn.text = ""
        mfrPn.text = ""
        desc.text = ""
        qty.text = ""
        price1.text = ""
    }
    
}
