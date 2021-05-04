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
    
    var data : String? {
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
        esPn.text = ""
        mfrPn.text = ""
        desc.text = ""
        qty.text = ""
        price1.text = ""
    }
    
}
