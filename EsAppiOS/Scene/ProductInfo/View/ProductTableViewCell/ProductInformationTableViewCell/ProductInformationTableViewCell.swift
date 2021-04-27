//
//  ProductInformationTableViewCell.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 4/24/21.
//

import UIKit

class ProductInformationTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var valueView: UIView!
    
    var item : ProductTableModel? {
        didSet {
            setupValue()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titleView.layer.borderWidth = 0.5
        titleView.layer.borderColor = UIColor.lightGray.cgColor
        valueView.layer.borderWidth = 0.5
        valueView.layer.borderColor = UIColor.lightGray.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupValue() {
        titleLabel.text = item?.title ?? ""
        valueLabel.text = item?.value ?? ""
    }
    
}
