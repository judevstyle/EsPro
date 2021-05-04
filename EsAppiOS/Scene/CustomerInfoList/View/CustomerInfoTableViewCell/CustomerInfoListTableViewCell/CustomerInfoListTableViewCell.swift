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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUI()  {
        
    }
    
}
