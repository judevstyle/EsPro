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
    func getProductDetailInfo3(request: GetProductDetailInfoRequest) -> Observable<[GetProductDetailInfo3Response]>
    func getSimilarRelatedPart(request: GetProductDetailInfoRequest) -> Observable<[GetSimilarRelatedPartResponse]>
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
    
    public func getProductDetailInfo3(request: GetProductDetailInfoRequest) -> Observable<[GetProductDetailInfo3Response]> {
        return provider
            .rx
            .request(.getProductDetailInfo(request: request))
            .filterSuccessfulStatusCodes()
            .map([GetProductDetailInfo3Response].self)
            .asObservable()
    }
    
    public func getSimilarRelatedPart(request: GetProductDetailInfoRequest) -> Observable<[GetSimilarRelatedPartResponse]> {
        return provider
            .rx
            .request(.getProductDetailInfo(request: request))
            .filterSuccessfulStatusCodes()
            .map([GetSimilarRelatedPartResponse].self)
            .asObservable()
    }
}
