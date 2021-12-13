//
//  BadgeSaleManView.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 11/12/2564 BE.
//

import UIKit

class BadgeSaleManView: UIView {

    let nibName = "BadgeSaleManView"
    var contentView:UIView?

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var titleText: UILabel!
    
    required override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        setupUI()
    }
    
    func commonInit() {
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    func setupUI() {
    }
    
}
