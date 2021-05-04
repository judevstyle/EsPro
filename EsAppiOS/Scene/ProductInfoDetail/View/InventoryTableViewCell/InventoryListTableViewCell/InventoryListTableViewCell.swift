//
//  InventoryListTableViewCell.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 4/24/21.
//

import UIKit

class InventoryListTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var key: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var onhand: UILabel!
    @IBOutlet weak var booking: UILabel!
    @IBOutlet weak var balance: UILabel!
    
    var item: InventoryTableModel? {
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
        key.text = item?.key ?? ""
        location.text = item?.location ?? ""
        onhand.text = item?.onhand ?? ""
        booking.text = item?.booking ?? ""
        balance.text = item?.balance ?? ""
    }
    
    
}
