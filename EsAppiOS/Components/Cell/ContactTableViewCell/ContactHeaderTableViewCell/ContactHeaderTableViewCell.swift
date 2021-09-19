//
//  ContactHeaderTableViewCell.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 9/19/21.
//

import UIKit

class ContactHeaderTableViewCell: UITableViewCell {

    @IBOutlet var box1View: UIView!
    @IBOutlet var box2View: UIView!
    @IBOutlet var box3View: UIView!
    @IBOutlet var box4View: UIView!
    @IBOutlet var box5View: UIView!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
        
        setupView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupView() {
        box1View.addRightBorder(with: .gray, andWidth: 0.5)
        box1View.addBottomBorder(with: .gray, andWidth: 0.5)
        
        box2View.addRightBorder(with: .gray, andWidth: 0.5)
        box2View.addBottomBorder(with: .gray, andWidth: 0.5)
        
        box3View.addRightBorder(with: .gray, andWidth: 0.5)
        box3View.addBottomBorder(with: .gray, andWidth: 0.5)
        
        box4View.addRightBorder(with: .gray, andWidth: 0.5)
        box4View.addBottomBorder(with: .gray, andWidth: 0.5)
        
        box5View.addRightBorder(with: .gray, andWidth: 0.5)
        box5View.addBottomBorder(with: .gray, andWidth: 0.5)
    }
}
