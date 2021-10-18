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
        
        inputUsername.text = "CHAIWAT_K"
        inputPassword.text = "1234"
        
//        inputUsername.text = "test"
//        inputPassword.text = "123123"
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
            
            guard let userID = weakSelf.inputUsername.text, userID != "", weakSelf.viewModel.output.checkPermissionAuthUser(user_id: userID)
            else { return}
//            weakSelf.openPopupDialog(title: "Incorret")
            weakSelf.gotoProductInfomation()
        }
    }
    
    func didAuthLoginError() -> (() -> Void) {
        return { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.stopLoding()
            weakSelf.gotoProductInfomation()
//            weakSelf.openScene(identifier: .SceneMain)
//            weakSelf.openPopupDialog(title: "Incorret")
        }
    }
    
    private func gotoProductInfomation(){
        UIView.transition(
             with: UIApplication.shared.keyWindow!,
             duration: 0.25,
             options: .transitionFlipFromLeft,
             animations: {
                let loadingStoryBoard = "ProductInfoList"
                // Override point for customization after application launch.
                let storyboard = UIStoryboard(name: loadingStoryBoard, bundle: nil)
                let initialViewController = storyboard.instantiateInitialViewController()

                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window?.rootViewController = initialViewController
                appDelegate.window?.makeKeyAndVisible()
         })
    }
    
}

//MARK: - Event
extension LoginViewController {
    @IBAction func btnTapLogin(_ sender: Any) {
        guard let userID = inputUsername.text, userID != "", let password = inputPassword.text, password != "" else {
            return
        }
        var request = LoginRequest()
        request.user_id = userID
        request.password = password
        viewModel.input.authLogin(request: request)
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
}

enum SearchType : String {
    case ES = "ES P/N"
    case MFR = "MFR P/N"
    case CustomerNo = "Customer No."
    case CustomerName = "CustomerName"
    
    var value: String {
        switch self {
        case .ES:
            return "espart"
        case .MFR:
            return "mfrpart"
        case .CustomerNo:
            return "customerno"
        case .CustomerName:
            return "customername"
        }
    }
}
