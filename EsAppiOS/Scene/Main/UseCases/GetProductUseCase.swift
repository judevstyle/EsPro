//
//  GetProductUseCase.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 3/29/21.
//

import Foundation
import RxSwift

public protocol GetProductUseCase {
    func execute(request: ProductRequest) -> Observable<[ProductResponse]>
}

public final class GetProductUseCaseImpl: GetProductUseCase {
    
    private var repository: MainRepository
    
    public init(repository: MainRepository = MainRepositoryImpl()) {
        self.repository = repository
    }
    
    public func execute(request: ProductRequest) -> Observable<[ProductResponse]> {
        return repository.getProduct(request: request)
    }
}
