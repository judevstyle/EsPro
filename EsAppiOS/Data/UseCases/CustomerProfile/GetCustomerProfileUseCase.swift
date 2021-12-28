//
//  GetCustomerProfileUseCase.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 28/12/2564 BE.
//

import Foundation
import RxSwift

public protocol GetCustomerProfileUseCase {
    func execute(request: GetCustomerProfileRequest) -> Observable<[GetCustomerProfileResponse]>
}

public final class GetCustomerProfileUseCaseImpl: GetCustomerProfileUseCase {
    
    private var repository: CustomerProfileRepository
    
    public init(repository: CustomerProfileRepository = CustomerProfileRepositoryImpl()) {
        self.repository = repository
    }
    
    public func execute(request: GetCustomerProfileRequest) -> Observable<[GetCustomerProfileResponse]> {
        return self.repository.getCustomerProfile(request: request)
    }
}
