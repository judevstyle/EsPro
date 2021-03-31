//
//  DataListView.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 3/27/21.
//

import UIKit

@IBDesignable
class DataListView: UIView {
    
    @IBOutlet weak var InnerView: UIView!
    @IBOutlet var OutletView: UIView!
    @IBOutlet weak var labelEsPn: UILabel!
    @IBOutlet weak var labelMFRPn: UILabel!
    @IBOutlet weak var labelDesc: UILabel!
    @IBOutlet weak var labelPrice1: UILabel!
    
    let nibName = "DataListView"
    var contentView: UIView?
    
    var item: ProductResponse? {
        didSet {
            setupValue()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        xibSetup()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        xibSetup()
        contentView?.prepareForInterfaceBuilder()
        
    }
    
    func xibSetup() {
        guard let view = loadViewFromNib() else { return }
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        contentView = view
        setUpUI()
        
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    func setUpUI() {
//        InnerView.layer.cornerRadius = 8.0
//        InnerView.layer.shadowRadius = 3.0
//        InnerView.layer.shadowOffset = .zero
//        InnerView.layer.shadowOpacity = 0.15

    }
    
    func setupValue() {
        labelEsPn.text = item?.ESPART 
        labelMFRPn.text = item?.MFRPART
        labelDesc.text = item?.DESCRIPTION ?? ""
        labelPrice1.text = String(item?.PRICE1 ?? 0)
    }
    
}
