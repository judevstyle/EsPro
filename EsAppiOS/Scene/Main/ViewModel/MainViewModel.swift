//
//  MainViewModel.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 3/29/21.
//

import Foundation
import RxMoya
import RxSwift

protocol MainProtocolInput {
    func getProduct(request: ProductRequest)
    func sortProduct(sortType: SortType, vc: MainViewController)
    func searchProduct(searchType: SearchType)
}

protocol MainProtocolOutput: class {
    var didGetProductSuccess: (() -> Void)? { get set }
    var didGetProductError: (() -> Void)? { get set }
    
    var didSortProductResult: (() -> Void)? { get set }
    
    func getSizeListProduct() -> Int
    func getItemProduct(index: Int) -> ProductResponse?
}

protocol MainProtocol: MainProtocolInput, MainProtocolOutput {
    var input: MainProtocolInput { get }
    var output: MainProtocolOutput { get }
}

class MainViewModel: MainProtocol, MainProtocolOutput {
    
    var input: MainProtocolInput { return self }
    var output: MainProtocolOutput { return self }
    
    // MARK: - Properties
    private var getProductUseCase: GetProductUseCase
    private var vc: MainViewController
    
    fileprivate let disposeBag = DisposeBag()
    
    init(
        getProductUseCase: GetProductUseCase = GetProductUseCaseImpl(),
        vc: MainViewController
    ) {
        self.getProductUseCase = getProductUseCase
        self.vc = vc
    }
    
    // MARK - Data-binding OutPut
    var didGetProductSuccess: (() -> Void)?
    var didGetProductError: (() -> Void)?
    var didSortProductResult: (() -> Void)?
    
    fileprivate var listProduct: [ProductResponse]?
    fileprivate var sortListProduct: [ProductResponse]?
    
    func getProduct(request: ProductRequest) {
        vc.startLodingCircle()
        var newRequest = ProductRequest()
        newRequest.query = "search"
        newRequest.subquery = "productinformation"
        newRequest.database = "inv"
        newRequest.prod = request.prod
        newRequest.pageno = request.pageno
        newRequest.searchBy = request.searchBy
        getProductUseCase
            .execute(request: newRequest)
            .subscribe(onNext: { [weak self] (response) in
                guard let weakSelf = self else { return }
                weakSelf.listProduct = response
                weakSelf.sortListProduct = response
                weakSelf.didGetProductSuccess?()
                weakSelf.vc.stopLoding()
            }, onError: { [weak self] error in
                guard let weakSelf = self else { return }
                weakSelf.didGetProductError?()
                weakSelf.vc.stopLoding()
            }).disposed(by: disposeBag)
    }
    
    func getSizeListProduct() -> Int {
        guard let count = sortListProduct?.count, count != 0 else { return 0 }
        return count
    }
    
    func getItemProduct(index: Int) -> ProductResponse? {
        guard let sortListProduct = sortListProduct else { return nil }
        let item = sortListProduct[index]
        return item
    }
    
    func sortProduct(sortType: SortType, vc: MainViewController) {
        vc.sortByButton.setTitle(sortType.rawValue, for: .normal)
        switch sortType {
        case .ES:
            let sortedArray = sortListProduct?.sorted {
                $0.ESPART < $1.ESPART
            }
            sortListProduct = sortedArray
        case .MFR:
            let sortedArray = sortListProduct?.sorted {
                $0.MFRPART < $1.MFRPART
            }
            sortListProduct = sortedArray
        case .None:
            sortListProduct = listProduct
        case .CustomerNo:
            sortListProduct = listProduct
        case .CustomerName:
            sortListProduct = listProduct
        }
        didSortProductResult?()
    }
    
    func searchProduct(searchType: SearchType) {
        var request = ProductRequest()
        request.prod = "FS"
        request.pageno = 1
        request.searchBy = searchType.value
        self.input.getProduct(request: request)
    }
}

enum SortType : String {
    case None = "None"
    case ES = "ES P/N"
    case MFR = "MFR P/N"
    case CustomerNo = "Customer No."
    case CustomerName = "CustomerName"
}

enum SearchType : String {
    case ES = "ES P/N"
    case MFR = "MFR P/N"
    case CustomerNo = "Customer No."
    case CustomerName = "CustomerName"
    
    var value: String {
        switch self {
        case .ES:
            return "espart"
        case .MFR:
            return "mfrpart"
        case .CustomerNo:
            return "customerno"
        case .CustomerName:
            return "customername"
        }
    }
}
