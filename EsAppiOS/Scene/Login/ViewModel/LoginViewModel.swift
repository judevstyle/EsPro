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
    func authLogin(request: LoginRequest)
}

protocol LoginProtocolOutput: class {
    var didAuthLoginSuccess: (() -> Void)? { get set }
    var didAuthLoginError: (() -> Void)? { get set }
    
    func getListAuthUser() -> [LoginResponse]?
    func checkPermissionAuthUser(user_id: String) -> Bool
}

protocol LoginProtocol: LoginProtocolInput, LoginProtocolOutput {
    var input: LoginProtocolInput { get }
    var output: LoginProtocolOutput { get }
}

class LoginViewModel: LoginProtocol, LoginProtocolOutput {
    
    var input: LoginProtocolInput { return self }
    var output: LoginProtocolOutput { return self }
    
    // MARK: - Properties
    private var loginUseCase: LoginUseCase
    private var vcLogin: LoginViewController
    
    fileprivate let disposeBag = DisposeBag()
    
    init(
        loginUseCase: LoginUseCase = LoginUseCaseImpl(),
        vcLogin: LoginViewController
    ) {
        self.loginUseCase = loginUseCase
        self.vcLogin = vcLogin
    }
    
    // MARK - Data-binding OutPut
    var didAuthLoginSuccess: (() -> Void)?
    var didAuthLoginError: (() -> Void)?
    
    private var listAuthUser: [LoginResponse]?
    
    func authLogin(request: LoginRequest) {
        vcLogin.startLodingCircle()
        var newRequest = request
        newRequest.query = "secur"
        newRequest.subquery = "login"
        newRequest.user_id = "CHAIWAT_K"
        newRequest.password = "1234"
        newRequest.database = "inv"
        loginUseCase
            .execute(request: newRequest)
            .subscribe(onNext: { [weak self] (response) in
                guard let weakSelf = self else { return }
                weakSelf.listAuthUser = response
                weakSelf.didAuthLoginSuccess?()
                weakSelf.vcLogin.stopLoding()
            }, onError: { [weak self] error in
                guard let weakSelf = self else { return }
                weakSelf.didAuthLoginError?()
                weakSelf.vcLogin.stopLoding()
            }).disposed(by: disposeBag)
        didAuthLoginSuccess?()
    }
    
    func getListAuthUser() -> [LoginResponse]? {
        return self.listAuthUser
    }
    
    func checkPermissionAuthUser(user_id: String) -> Bool{
        guard let listAuth = listAuthUser else { return false }
        for item in listAuth {
            if item.ACTIVE == 1 {
                return true
            }
        }
        return false
    }
}
