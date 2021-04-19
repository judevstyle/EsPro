//
//  ImageCollectionViewCell.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 17/4/2564 BE.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet var view: UIView!
    @IBOutlet var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func configure() {
        view.layer.cornerRadius = 3
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
    }

}
