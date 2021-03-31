//
//  LoginUseCase.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 3/29/21.
//

import Foundation
import RxSwift

public protocol LoginUseCase {
    func execute(request: LoginRequest) -> Observable<[LoginResponse]>
}

public final class LoginUseCaseImpl: LoginUseCase {
    
    private var repository: LoginRepository
    
    public init(repository: LoginRepository = LoginRepositoryImpl()) {
        self.repository = repository
    }
    
    public func execute(request: LoginRequest) -> Observable<[LoginResponse]> {
        return repository.authLogin(request: request)
    }
}
