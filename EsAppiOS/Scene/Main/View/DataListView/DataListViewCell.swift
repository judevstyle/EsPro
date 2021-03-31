//
//  DataListViewCell.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 3/27/21.
//

import UIKit

class DataListViewCell: UITableViewCell {

    @IBOutlet weak var dataListView: DataListView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
