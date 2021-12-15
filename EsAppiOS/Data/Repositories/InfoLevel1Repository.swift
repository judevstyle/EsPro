//
//  InfoLevel1Repository.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 15/12/2564 BE.
//

import Foundation
import RxSwift
import Moya
import RxMoya

public protocol InfoLevel1Repository {
    func productInfo(request: GetInfoLevel1Request) -> Observable<[GetProductInfoResponse]>
    func customerInfo(request: GetInfoLevel1Request) -> Observable<[GetCustomerInfoResponse]>
}

public struct InfoLevel1RepositoryImpl: InfoLevel1Repository {
    private let provider = MoyaProvider<InfoLevel1API>()
    
    public init() {}
    
    public func productInfo(request: GetInfoLevel1Request) -> Observable<[GetProductInfoResponse]> {
        return provider
            .rx
            .request(.getInfoLevel1(request: request))
            .filterSuccessfulStatusCodes()
            .map([GetProductInfoResponse].self)
            .asObservable()
    }
    
    public func customerInfo(request: GetInfoLevel1Request) -> Observable<[GetCustomerInfoResponse]> {
        return provider
            .rx
            .request(.getInfoLevel1(request: request))
            .filterSuccessfulStatusCodes()
            .map([GetCustomerInfoResponse].self)
            .asObservable()
    }
}
