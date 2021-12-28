//
//  SimilarRelatedHeaderTableViewCell.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 4/27/21.
//

import UIKit

class SimilarRelatedHeaderTableViewCell: UITableViewHeaderFooterView {

    @IBOutlet weak var titleHeader: UILabel!
    
    var title: String? {
        didSet {
            titleHeader.text = title
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
