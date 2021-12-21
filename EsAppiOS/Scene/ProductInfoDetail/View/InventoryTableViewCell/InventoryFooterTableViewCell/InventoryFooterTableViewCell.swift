//
//  InventoryFooterTableViewCell.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 4/24/21.
//

import UIKit

class InventoryFooterTableViewCell: UITableViewHeaderFooterView {

    @IBOutlet weak var onhandSumValue: UILabel!
    @IBOutlet weak var bookingSumValue: UILabel!
    @IBOutlet weak var balanceSumValue: UILabel!
    
    var onhand: Double? {
        didSet {
            onhandSumValue.text = "\(onhand ?? 0)"
        }
    }
    
    var booking: Double? {
        didSet {
            bookingSumValue.text = "\(booking ?? 0)"
        }
    }
    
    var balance: Double? {
        didSet {
            balanceSumValue.text = "\(balance ?? 0)"
        }
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func commonInit() {
    //initialize my subviews
    }
}
