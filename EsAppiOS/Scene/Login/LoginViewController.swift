//
//  LoginViewController.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 3/26/21.
//

import UIKit
import Moya

class LoginViewController: UIViewController {
    
    @IBOutlet weak var viewKeyboardHeight: NSLayoutConstraint!
    @IBOutlet weak var inputUsername: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnHidePassword: UIButton!

    @IBOutlet weak var bgGradientView: Gradient!
    
    @IBOutlet weak var iconKeyImage: UIImageView!
    // ViewModel
    lazy var viewModel: LoginProtocol = {
        let vm = LoginViewModel(vcLogin: self)
        self.configure(vm)
        self.bindToViewModel()
        return vm
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);
    }
    
    func configure(_ interface: LoginProtocol) {
        self.viewModel = interface
    }
    
    @IBAction func actionHideShowPassword(_ sender: Any) {
        inputPassword.isSecureTextEntry = !inputPassword.isSecureTextEntry
    }
}

//MARK: - SetupUI
extension LoginViewController {
    func setupUI() {
        
        viewKeyboardHeight.constant = 0
        hideKeyboardWhenTappedAround()
        inputUsername.setRounded(rounded: 10)
        inputUsername.setPaddingLeft(padding: 105)
        inputPassword.setRounded(rounded: 10)
        inputPassword.setPaddingLeft(padding: 105)

        btnLogin.setRounded(rounded: 10)
        
        btnHidePassword.contentVerticalAlignment = .fill
        btnHidePassword.contentHorizontalAlignment = .fill
        btnHidePassword.imageEdgeInsets = UIEdgeInsets(top: 20, left: 16, bottom: 20, right: 16)
        
//        inputUsername.text = "CHAIWAT_K"
//        inputPassword.text = "1234"
        
        inputUsername.text = "CHAIWAT_K"
        inputPassword.text = "1234"
        
        iconKeyImage.image = UIImage(named: "key-icon")?.withRenderingMode(.alwaysTemplate)
        iconKeyImage.tintColor = .IconLogin()
    }

}

// MARK: - Binding
extension LoginViewController {
    
    func bindToViewModel() {
        viewModel.output.didAuthLoginSuccess = didAuthLoginSuccess()
        viewModel.output.didAuthLoginError = didAuthLoginError()
    }
    
    func didAuthLoginSuccess() -> (() -> Void) {
        return { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.gotoProductInfomation()
        }
    }
    
    func didAuthLoginError() -> (() -> Void) {
        return { [weak self] in
            guard let weakSelf = self else { return }
//            weakSelf.stopLoding()
//            weakSelf.gotoProductInfomation()
//            weakSelf.openScene(identifier: .SceneMain)
//            weakSelf.openPopupDialog(title: "Incorret")
        }
    }
    
    private func gotoProductInfomation(){
//        UIView.transition(
//             with: UIApplication.shared.keyWindow!,
//             duration: 0.25,
//             options: .transitionFlipFromLeft,
//             animations: {
//                let loadingStoryBoard = "ProductInfoList"
//                // Override point for customization after application launch.
//                let storyboard = UIStoryboard(name: loadingStoryBoard, bundle: nil)
//                let initialViewController = storyboard.instantiateInitialViewController()
//
//                let appDelegate = UIApplication.shared.delegate as! AppDelegate
//                appDelegate.window?.rootViewController = initialViewController
//                appDelegate.window?.makeKeyAndVisible()
//         })
        
        NavigationManager.instance.setRootViewController(rootView: .productInfoList)
    }
    
}

//MARK: - Event
extension LoginViewController {
    @IBAction func btnTapLogin(_ sender: Any) {
        guard let userId = inputUsername.text, userId != "", let password = inputPassword.text, password != "" else {
            return
        }
        viewModel.input.authLogin(userId: userId, password: password)
    }
}

//MARK: - EventKeyboardShowHide
extension LoginViewController {
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardHeight = keyboardFrame.cgRectValue.size.height
            viewKeyboardHeight.constant = keyboardHeight
        }
    }
    
    @objc func keyboardWillHide(sender: NSNotification) {
        viewKeyboardHeight.constant = 0
    }
}



enum SortType : String {
    case None = "None"
    case ES = "ES P/N"
    case MFR = "MFR P/N"
    case CustomerNo = "Customer No."
    case CustomerName = "CustomerName"
    
    var value: String {
        switch self {
        case .ES:
            return "ES"
        case .MFR:
            return "MFR"
        case .CustomerNo:
            return "NO"
        case .CustomerName:
            return "NAME"
        default:
            return ""
        }
    }
    
}

enum SearchType : String {
    case ES = "ES P/N"
    case MFR = "MFR P/N"
    case CustomerNo = "Customer No."
    case CustomerName = "CustomerName"
    
    var value: String {
        switch self {
        case .ES:
            return "ES"
        case .MFR:
            return "MFR"
        case .CustomerNo:
            return "NO"
        case .CustomerName:
            return "NAME"
        default:
            return ""
        }
    }
}
