//
//  PriceListTableViewCell.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 19/4/2564 BE.
//

import UIKit

class PriceListTableViewCell: UITableViewCell {

    @IBOutlet weak var qtyLabel: UILabel!
    @IBOutlet weak var unitPriceLabel: UILabel!
    
    var item: PriceTableModel? {
        didSet {
            setupValue()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupValue() {
        qtyLabel.text = item?.qyt ?? ""
        unitPriceLabel.text = "\(item?.unitPrice ?? 0.0)"
    }
    
}
