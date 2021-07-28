//
//  CustomerInfoListTableViewCell.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 5/4/21.
//

import UIKit

class CustomerInfoListTableViewCell: UITableViewCell {

    @IBOutlet weak var customerNo: UILabel!
    @IBOutlet weak var customerName: UILabel!
    
    @IBOutlet var customerNoView: UIView!
    @IBOutlet var customerNameView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUI()  {
        customerNoView.useUnderline()
        customerNameView.useUnderline()
        
//        customerNoView.addLeftBorder(with: UIColor.gray, andWidth: 0.5)
        customerNoView.addRightBorder(with: UIColor.gray, andWidth: 0.5)
//        customerNameView.addRightBorder(with: UIColor.gray, andWidth: 0.5)
    }
    
}
