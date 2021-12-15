//
//  GetCustomerInfoUseCase.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 15/12/2564 BE.
//

import Foundation
import RxSwift

public protocol GetCustomerInfoUseCase {
    func execute(request: GetInfoLevel1Request) -> Observable<[GetCustomerInfoResponse]>
}

public final class GetCustomerInfoUseCaseImpl: GetCustomerInfoUseCase {
    
    private var repository: InfoLevel1Repository
    
    public init(repository: InfoLevel1Repository = InfoLevel1RepositoryImpl()) {
        self.repository = repository
    }
    
    public func execute(request: GetInfoLevel1Request) -> Observable<[GetCustomerInfoResponse]> {
        return self.repository.customerInfo(request: request)
    }

}
