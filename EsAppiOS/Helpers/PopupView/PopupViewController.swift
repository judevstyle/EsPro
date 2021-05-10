//
//  PopupViewController.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 5/9/21.
//

import UIKit

class PopupViewController: UIViewController {
    
    @IBOutlet var titleText: UILabel!
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet var bgDialog: UIView!
    var titlePopup: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI(){
        bgDialog.setRounded(rounded: 8)
        button.setRounded(rounded: 5)
        titleText.text = titlePopup
    }
    
    @IBAction func handleOk(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension UIViewController {
    func openPopupDialog(title: String) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "PopupView", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "PopupView") as! PopupViewController
        vc.titlePopup = title
        vc.modalTransitionStyle = .crossDissolve
//        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}
