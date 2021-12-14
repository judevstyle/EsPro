//
//  GetLoginUseCase.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 14/12/2564 BE.
//

import Foundation
import RxSwift

public protocol GetLoginUseCase {
    func execute(userid: String?) -> Observable<[GetLoginResponse]>
}

public final class GetLoginUseCaseImpl: GetLoginUseCase {
    
    private var repository: LoginRepository
    
    public init(repository: LoginRepository = LoginRepositoryImpl()) {
        self.repository = repository
    }
    
    public func execute(userid: String?) -> Observable<[GetLoginResponse]> {

        var request: GetLoginRequest = GetLoginRequest()
        request.userid = userid
        request.query = "login"
        return repository.login(request: request)
    }
}
