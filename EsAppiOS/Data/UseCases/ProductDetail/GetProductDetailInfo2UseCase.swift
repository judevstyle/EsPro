//
//  GetProductDetailInfo2UseCase.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 19/12/2564 BE.
//

import Foundation
import RxSwift

public protocol GetProductDetailInfo2UseCase {
    func execute(request: GetProductDetailInfoRequest) -> Observable<[GetProductDetailInfo2Response]>
}

public final class GetProductDetailInfo2UseCaseImpl: GetProductDetailInfo2UseCase {
    
    private var repository: ProductDetailRepository
    
    public init(repository: ProductDetailRepository = ProductDetailRepositoryImpl()) {
        self.repository = repository
    }
    
    public func execute(request: GetProductDetailInfoRequest) -> Observable<[GetProductDetailInfo2Response]> {
        return self.repository.getProductDetailInfo2(request: request)
    }
}
