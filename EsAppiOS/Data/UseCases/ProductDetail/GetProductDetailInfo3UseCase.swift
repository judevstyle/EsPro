//
//  GetProductDetailInfo3UseCase.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 28/12/2564 BE.
//

import Foundation
import RxSwift

public protocol GetProductDetailInfo3UseCase {
    func execute(request: GetProductDetailInfoRequest) -> Observable<[GetProductDetailInfo3Response]>
}

public final class GetProductDetailInfo3UseCaseImpl: GetProductDetailInfo3UseCase {
    
    private var repository: ProductDetailRepository
    
    public init(repository: ProductDetailRepository = ProductDetailRepositoryImpl()) {
        self.repository = repository
    }
    
    public func execute(request: GetProductDetailInfoRequest) -> Observable<[GetProductDetailInfo3Response]> {
        return self.repository.getProductDetailInfo3(request: request)
    }
}
