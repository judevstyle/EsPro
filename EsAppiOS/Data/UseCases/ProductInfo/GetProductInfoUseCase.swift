//
//  GetProductInfoUseCase.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 15/12/2564 BE.
//

import Foundation
import RxSwift

public protocol GetProductInfoUseCase {
    func execute(request: GetInfoLevel1Request) -> Observable<[GetProductInfoResponse]>
}

public final class GetProductInfoUseCaseImpl: GetProductInfoUseCase {
    
    private var repository: InfoLevel1Repository
    
    public init(repository: InfoLevel1Repository = InfoLevel1RepositoryImpl()) {
        self.repository = repository
    }

    public func execute(request: GetInfoLevel1Request) -> Observable<[GetProductInfoResponse]> {
        return self.repository.productInfo(request: request)
    }
    
}
