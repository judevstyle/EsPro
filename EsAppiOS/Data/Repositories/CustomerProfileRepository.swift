//
//  CustomerProfileRepository.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 28/12/2564 BE.
//

import Foundation
import RxSwift
import Moya
import RxMoya

public protocol CustomerProfileRepository {
    func getCustomerProfile(request: GetCustomerProfileRequest) -> Observable<[GetCustomerProfileResponse]>
}

public struct CustomerProfileRepositoryImpl: CustomerProfileRepository {
    private let provider = MoyaProvider<CustomerProfileAPI>()
    
    public init() {}
    
    public func getCustomerProfile(request: GetCustomerProfileRequest) -> Observable<[GetCustomerProfileResponse]> {
        return provider
            .rx
            .request(.getCustomerProfile(req: request))
            .filterSuccessfulStatusCodes()
            .map([GetCustomerProfileResponse].self)
            .asObservable()
    }
}
