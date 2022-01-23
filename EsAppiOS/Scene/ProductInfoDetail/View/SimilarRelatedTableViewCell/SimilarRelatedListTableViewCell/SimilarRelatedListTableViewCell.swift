//
//  SimilarRelatedListTableViewCell.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 4/27/21.
//

import UIKit

class SimilarRelatedListTableViewCell: UITableViewCell {

    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var esPnText: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var unitPrice: UILabel!
    @IBOutlet weak var imagePicView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var data : GetSimilarRelatedPartResponse? {
        didSet {
            setupValue()
        }
    }
    
    
    func setupValue() {
        if let urlImage = URL(string: "\(DomainNameConfig.ImagePath.urlString)\(data?.Picture ?? "").jpg") {
            imagePicView.kf.setImageDefault(with: urlImage)
        }
        
        titleText.text = data?.MfrPartNo ?? ""
        esPnText.text = data?.ESPartNo ?? ""
        desc.text = "\(data?.Desc2 ?? "")\n\(data?.Desc3 ?? "")\n\(data?.Desc4 ?? "")"
        unitPrice.text =  String(format: "%.2f", data?.UnitPrice ?? 0.0)
    }
}
