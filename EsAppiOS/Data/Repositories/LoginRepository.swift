//
//  LoginRepository.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 14/12/2564 BE.
//

import Foundation
import RxSwift
import Moya
import RxMoya

public protocol LoginRepository {
    func login(request: GetLoginRequest) -> Observable<[GetLoginResponse]>
}

public struct LoginRepositoryImpl: LoginRepository {
    private let provider = MoyaProvider<LoginAPI>()
    
    public init() {}
    
    public func login(request: GetLoginRequest) -> Observable<[GetLoginResponse]> {
        return provider
            .rx
            .request(.login(request: request))
            .filterSuccessfulStatusCodes()
            .map([GetLoginResponse].self)
            .asObservable()
    }
}
