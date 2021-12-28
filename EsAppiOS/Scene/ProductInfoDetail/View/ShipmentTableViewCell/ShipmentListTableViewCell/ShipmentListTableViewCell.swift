//
//  ShipmentListTableViewCell.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 4/24/21.
//

import UIKit

class ShipmentListTableViewCell: UITableViewCell {

    @IBOutlet weak var poNo: UILabel!
    @IBOutlet weak var item: UILabel!
    @IBOutlet weak var poDate: UILabel!
    @IBOutlet weak var qtyAvl: UILabel!
    @IBOutlet weak var estArr: UILabel!
    @IBOutlet weak var conArr: UILabel!
    
    var data : ShipmentTableModel? {
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
        poNo.text = data?.poNo ?? ""
        item.text = data?.item ?? ""
        poDate.text = data?.poDate ?? ""
        qtyAvl.text = data?.qtyAvl ?? ""
        estArr.text = data?.estArr ?? ""
        conArr.text = data?.conArr ?? ""
//        increase.text = data?.increase ?? ""
//        approve.text = data?.approve ?? ""
    }
}
