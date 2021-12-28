//
//  ContactItemTableViewCell.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 9/19/21.
//

import UIKit

class ContactItemTableViewCell: UITableViewCell {

    @IBOutlet weak var nameValue: UILabel!
    @IBOutlet weak var jobDescValue: UILabel!
    @IBOutlet weak var positionValue: UILabel!
    @IBOutlet weak var headPhoneValue: UILabel!
    @IBOutlet weak var emailValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var data: GetCustomerProfileResponse? {
        didSet {
            setupValue()
        }
    }
    
    func setupValue() {
        nameValue.text = data?.CE_NAME ?? ""
        jobDescValue.text = data?.CE_JOBDESC ?? ""
        positionValue.text = data?.CE_POSITION ?? ""
        headPhoneValue.text = data?.CE_HANDPHONE ?? ""
        emailValue.text = data?.CE_EMAIL ?? ""
        
    }
    
}
