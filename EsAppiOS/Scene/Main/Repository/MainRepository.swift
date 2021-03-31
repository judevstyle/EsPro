//
//  MainRepository.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 3/29/21.
//

import Foundation
import RxSwift
import Moya
import RxMoya

public protocol MainRepository {
    func getProduct(request: ProductRequest) -> Observable<[ProductResponse]>
}

public struct MainRepositoryImpl: MainRepository {
    private let provider = MoyaProvider<APIService>()

    public init() {}
    
    public func getProduct(request: ProductRequest) -> Observable<[ProductResponse]> {
        return provider
            .rx
            .request(.getProduct(request: request))
            .filterSuccessfulStatusCodes()
            .map([ProductResponse].self)
            .asObservable()
    }
}
