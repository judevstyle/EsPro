//
//  CustomerInfoHeaderTableViewCell.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 7/29/21.
//

import UIKit

class CustomerInfoHeaderTableViewCell: UITableViewCell {

    @IBOutlet var customerNoView: UIView!
    @IBOutlet var customerNo: UILabel!
    
    @IBOutlet var customerNameView: UIView!
    
    @IBOutlet var customerName: UILabel!
    
    @IBOutlet weak var stackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func setupUI()  {
        customerNoView.useUnderline()
        customerNameView.useUnderline()
        customerNoView.addRightBorder(with: UIColor.gray, andWidth: 0.5)
        
        let newframe = CGRect(origin: .zero, size: CGSize(width: stackView.frame.width, height: stackView.frame.height))

        stackView.backgroundColor = UIColor.gradientColor(startColor: .BGTableHeaderTop(), endColor: .BGTableHeaderBottom(), frame: newframe)
    }
    
}
