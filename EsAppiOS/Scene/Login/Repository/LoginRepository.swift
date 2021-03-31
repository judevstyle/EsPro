//
//  LoginRepository.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 3/29/21.
//

import Foundation
import RxSwift
import Moya
import RxMoya

public protocol LoginRepository {
    func authLogin(request: LoginRequest) -> Observable<[LoginResponse]>
}

public struct LoginRepositoryImpl: LoginRepository {
    private let provider = MoyaProvider<APIService>()

    public init() {}
    
    public func authLogin(request: LoginRequest) -> Observable<[LoginResponse]> {
        return provider
            .rx
            .request(.authLogin(request: request))
            .filterSuccessfulStatusCodes()
            .map([LoginResponse].self)
            .asObservable()
    }
}
