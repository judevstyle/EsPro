//
//  ProductDetailRepository.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 19/12/2564 BE.
//

import Foundation
import RxSwift
import Moya
import RxMoya

public protocol ProductDetailRepository {
    func getProductDetailInfo2(request: GetProductDetailInfoRequest) -> Observable<[GetProductDetailInfo2Response]>
}

public struct ProductDetailRepositoryImpl: ProductDetailRepository {
    private let provider = MoyaProvider<ProductDetailAPI>()
    
    public init() {}
    
    public func getProductDetailInfo2(request: GetProductDetailInfoRequest) -> Observable<[GetProductDetailInfo2Response]> {
        return provider
            .rx
            .request(.getProductDetailInfo(request: request))
            .filterSuccessfulStatusCodes()
            .map([GetProductDetailInfo2Response].self)
            .asObservable()
    }
}
