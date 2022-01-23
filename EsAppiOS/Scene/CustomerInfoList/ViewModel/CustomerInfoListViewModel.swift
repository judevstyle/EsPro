//
//  CustomerInfoListViewModel.swift
//  EsAppiOS
//
//  Created by Nontawat Kanboon on 16/12/2564 BE.
//

import Foundation
import RxMoya
import RxSwift
import UIKit

protocol CustomerInfoListProtocolInput {
    func getCustomerInfo(request: GetInfoLevel1Request)
    
    func didSelectRowAt(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
}

protocol CustomerInfoListProtocolOutput: class {
    var didGetCustomerInfoSuccess: (() -> Void)? { get set }
    var didGetCustomerInfoError: (() -> Void)? { get set }
    
    func getNumberOfRowsInSection() -> Int
    func getCellForRowAt(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    func getHeightForRowAt(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
}

protocol CustomerInfoListProtocol: CustomerInfoListProtocolInput, CustomerInfoListProtocolOutput {
    var input: CustomerInfoListProtocolInput { get }
    var output: CustomerInfoListProtocolOutput { get }
}

class CustomerInfoListViewModel: CustomerInfoListProtocol, CustomerInfoListProtocolOutput {
    
    var input: CustomerInfoListProtocolInput { return self }
    var output: CustomerInfoListProtocolOutput { return self }
    
    // MARK: - Properties
    private var getCustomerInfoUseCase: GetCustomerInfoUseCase
    private var vc: CustomerInfoListViewController
    
    fileprivate let disposeBag = DisposeBag()
    
    init(
        getCustomerInfoUseCase: GetCustomerInfoUseCase = GetCustomerInfoUseCaseImpl(),
        vc: CustomerInfoListViewController
    ) {
        self.getCustomerInfoUseCase = getCustomerInfoUseCase
        self.vc = vc
    }
    
    // MARK - Data-binding OutPut
    var didGetCustomerInfoSuccess: (() -> Void)?
    var didGetCustomerInfoError: (() -> Void)?
    
    private var listCustomerInfo: [GetCustomerInfoResponse] = []
    
    func getCustomerInfo(request: GetInfoLevel1Request) {
        vc.startLodingCircle()
        listCustomerInfo.removeAll()
        getCustomerInfoUseCase
            .execute(request: request)
            .subscribe(onNext: { [weak self] (response) in
                guard let weakSelf = self else { return }
                debugPrint("Success : \(response)")
                weakSelf.vc.stopLoding()
                weakSelf.listCustomerInfo = response
                weakSelf.didGetCustomerInfoSuccess?()

            }, onError: { [weak self] error in
                guard let weakSelf = self else { return }
                debugPrint("Error : \(error)")
                weakSelf.vc.stopLoding()
                weakSelf.didGetCustomerInfoError?()
            }).disposed(by: disposeBag)
    }

}

//OutPut TableView
extension CustomerInfoListViewModel {
    
    func getNumberOfRowsInSection() -> Int {
        if listCustomerInfo.count == 0 {
            return 2
        } else {
            return self.listCustomerInfo.count + 1
        }
    }
    
    func getCellForRowAt(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomerInfoHeaderTableViewCell", for: indexPath) as! CustomerInfoHeaderTableViewCell
            cell.backgroundColor = UIColor.clear
            cell.selectionStyle = .none
            cell.setupUI()
            return cell
        } else {
            if self.listCustomerInfo.count == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "EmptyTableViewCell", for: indexPath) as! EmptyTableViewCell
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "CustomerInfoListTableViewCell", for: indexPath) as! CustomerInfoListTableViewCell
                cell.backgroundColor = UIColor.clear
                cell.selectionStyle = .none
                cell.setupUI()
                cell.item = self.listCustomerInfo[indexPath.item - 1]
                return cell
            }
        }
    }
    
    func getHeightForRowAt(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.item == 0 {
            return 60
        } else {
            if self.listCustomerInfo.count == 0 {
                return 60
            } else {
                return 44
            }
        }
    }
    
    func didSelectRowAt(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.item == 0 {
        } else {
            let item = listCustomerInfo[indexPath.item-1]
            if let customerNo = item.CUSTOMER_NO {
                NavigationManager.instance.pushVC(to: .customerInfoDetail(customerNo: "\(customerNo)", customerName: item.CUSTOMER_NAME ?? ""))
            }
        }
    }
    
}
