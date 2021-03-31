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
}

//MARK: - SetupUI
extension LoginViewController {
    func setupUI(){
        viewKeyboardHeight.constant = 0
        hideKeyboardWhenTappedAround()
        inputUsername.setRounded(rounded: 8)
        inputUsername.setPaddingLeftAndRight(padding: 16)
        inputPassword.setRounded(rounded: 8)
        inputPassword.setPaddingLeftAndRight(padding: 16)
        
        btnLogin.setRounded(rounded: 8)
        
        inputUsername.text = "CHAIWAT_K"
        inputPassword.text = "1234"
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
            
            weakSelf.openScene(identifier: .SceneMain)
        }
    }
    
    func didAuthLoginError() -> (() -> Void) {
        return { [weak self] in
            guard let weakSelf = self else { return }
            weakSelf.stopLoding()
        }
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

