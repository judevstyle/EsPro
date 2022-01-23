//
//  ProductInfoListViewModel.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 15/12/2564 BE.
//

import Foundation
import RxMoya
import RxSwift
import UIKit

protocol ProductInfoListProtocolInput {
    func getProductInfo(request: GetInfoLevel1Request)
    
    func didSelectRowAt(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
}

protocol ProductInfoListProtocolOutput: class {
    var didGetProductInfoSuccess: (() -> Void)? { get set }
    var didGetProductInfoError: (() -> Void)? { get set }
    
    func getNumberOfRowsInSection() -> Int
    func getCellForRowAt(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    func getHeightForRowAt(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
}

protocol ProductInfoListProtocol: ProductInfoListProtocolInput, ProductInfoListProtocolOutput {
    var input: ProductInfoListProtocolInput { get }
    var output: ProductInfoListProtocolOutput { get }
}

class ProductInfoListViewModel: ProductInfoListProtocol, ProductInfoListProtocolOutput {
    
    var input: ProductInfoListProtocolInput { return self }
    var output: ProductInfoListProtocolOutput { return self }
    
    // MARK: - Properties
    private var getProductInfoUseCase: GetProductInfoUseCase
    private var vc: ProductInfoListViewController
    
    fileprivate let disposeBag = DisposeBag()
    
    init(
        getProductInfoUseCase: GetProductInfoUseCase = GetProductInfoUseCaseImpl(),
        vc: ProductInfoListViewController
    ) {
        self.getProductInfoUseCase = getProductInfoUseCase
        self.vc = vc
    }
    
    // MARK - Data-binding OutPut
    var didGetProductInfoSuccess: (() -> Void)?
    var didGetProductInfoError: (() -> Void)?
    
    private var listProductInfo: [GetProductInfoResponse] = []
    
    func getProductInfo(request: GetInfoLevel1Request) {
        vc.startLodingCircle()
        listProductInfo.removeAll()
        getProductInfoUseCase
            .execute(request: request)
            .subscribe(onNext: { [weak self] (response) in
                guard let weakSelf = self else { return }
                debugPrint("Success : \(response)")
                weakSelf.vc.stopLoding()
                weakSelf.listProductInfo = response
                weakSelf.didGetProductInfoSuccess?()

            }, onError: { [weak self] error in
                guard let weakSelf = self else { return }
                debugPrint("Error : \(error)")
                weakSelf.vc.stopLoding()
                weakSelf.didGetProductInfoError?()
            }).disposed(by: disposeBag)
    }

}

//OutPut TableView
extension ProductInfoListViewModel {
    
    func getNumberOfRowsInSection() -> Int {
        if listProductInfo.count == 0 {
            return 2
        } else {
            return self.listProductInfo.count + 1
        }
    }
    
    func getCellForRowAt(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductInfoHeaderTableViewCell", for: indexPath) as! ProductInfoHeaderTableViewCell
            cell.backgroundColor = UIColor.clear
            cell.selectionStyle = .none
            cell.setupUI()
            return cell
        } else {
            if self.listProductInfo.count == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "EmptyTableViewCell", for: indexPath) as! EmptyTableViewCell
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ProductInfoListTableViewCell", for: indexPath) as! ProductInfoListTableViewCell
                cell.backgroundColor = UIColor.clear
                cell.selectionStyle = .none
                cell.setupUI()
                cell.item = self.listProductInfo[indexPath.item-1]
                return cell
            }
        }
    }
    
    func getHeightForRowAt(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.item == 0 {
            return 60
        } else {
            if self.listProductInfo.count == 0 {
                return 60
            } else {
                return 44
            }
        }
    }
    
    func didSelectRowAt(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.item == 0 {
        } else {
            let item = listProductInfo[indexPath.item-1]
            if let prod = item.ES_PN {
                NavigationManager.instance.pushVC(to: .produceInfoDetail(prod: prod))
            }
        }
    }
    
}
