//
//  LoginViewModel.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 3/29/21.
//

import Foundation
import RxMoya
import RxSwift

protocol LoginProtocolInput {
    func authLogin(userId: String?, password: String?)
}

protocol LoginProtocolOutput: class {
    var didAuthLoginSuccess: (() -> Void)? { get set }
    var didAuthLoginError: (() -> Void)? { get set }
}

protocol LoginProtocol: LoginProtocolInput, LoginProtocolOutput {
    var input: LoginProtocolInput { get }
    var output: LoginProtocolOutput { get }
}

class LoginViewModel: LoginProtocol, LoginProtocolOutput {
    
    var input: LoginProtocolInput { return self }
    var output: LoginProtocolOutput { return self }
    
    // MARK: - Properties
    private var getLoginUseCase: GetLoginUseCase
    private var vcLogin: LoginViewController
    
    fileprivate let disposeBag = DisposeBag()
    
    init(
        getLoginUseCase: GetLoginUseCase = GetLoginUseCaseImpl(),
        vcLogin: LoginViewController
    ) {
        self.getLoginUseCase = getLoginUseCase
        self.vcLogin = vcLogin
    }
    
    // MARK - Data-binding OutPut
    var didAuthLoginSuccess: (() -> Void)?
    var didAuthLoginError: (() -> Void)?

    func authLogin(userId: String?, password: String?) {
        vcLogin.startLodingCircle()
        getLoginUseCase
            .execute(userid: userId)
            .subscribe(onNext: { [weak self] (response) in
                guard let weakSelf = self else { return }
                debugPrint("Success : \(response)")
                weakSelf.vcLogin.stopLoding()
                
                if response.count > 0 {
                    var isVerifyUser: Bool = false
                    response.forEach({ item in
                        if item.PASSWORD == password {
                            isVerifyUser = true
                            return
                        }
                    })
                    
                    if isVerifyUser {
                        weakSelf.didAuthLoginSuccess?()
                    } else {
                        weakSelf.vcLogin.openPopupDialog(title: "Incorrect password!")
                    }
                } else {
                    weakSelf.didAuthLoginError?()
                    weakSelf.vcLogin.openPopupDialog(title: "UserID not found!")
                }

            }, onError: { [weak self] error in
                guard let weakSelf = self else { return }
                debugPrint("Error : \(error)")
                weakSelf.didAuthLoginError?()
                weakSelf.vcLogin.stopLoding()
                weakSelf.vcLogin.openPopupDialog(title: "Error : \(error)")
            }).disposed(by: disposeBag)
    }
}
