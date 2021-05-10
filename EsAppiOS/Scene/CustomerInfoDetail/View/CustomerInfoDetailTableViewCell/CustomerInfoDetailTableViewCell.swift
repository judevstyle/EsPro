//
//  CustomerInfoDetailTableViewCell.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 5/9/21.
//

import UIKit

class CustomerInfoDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var arrowImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    
    
    var data : CustomerInfoDetailListModel? {
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
        title.text = data?.title ?? ""
    }
    
}
